import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../../utils/global.dart';
import 'dart:ui' as ui;

import '../quotesPages/showquotes.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  void update() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fontFamily = 'gc_m';
      changeColor = Colors.black54;
      changeTextColor = Colors.white;
      SliderRange = 22;
      lineHeight = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff1A1A36),
            Colors.black87,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: Colors.white, size: width * 0.08),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Edit Quotes',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'gc_m',
                              fontSize: width * 0.072),
                        )),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () async {
                            RenderRepaintBoundary boundary =
                                keyList[editQuoteIndex]
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;
                            ui.Image image = await boundary.toImage();
                            ByteData? byteData = (await (image.toByteData(
                                format: ui.ImageByteFormat.png)));
                            Uint8List img = byteData!.buffer.asUint8List();
                            ImageGallerySaver.saveImage(img);
                          },
                          icon: Icon(Icons.download,
                              color: Colors.white, size: width * 0.08)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.18, bottom: 20),
                      child: RepaintBoundary(
                        key: keyList[editQuoteIndex],
                        child: Container(
                            height: height * 0.4,
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                            decoration: BoxDecoration(color: changeColor),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                textAlign: align,
                                showQuotesList[editQuoteIndex]['quotes'],
                                style: TextStyle(
                                    height: lineHeight,
                                    color: changeTextColor,
                                    fontFamily: fontFamily,
                                    fontSize: SliderRange),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height * 0.25,
                  width: width,
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  decoration: const BoxDecoration(color: Color(0xff181A20)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //todo -------------------> BackGround Color
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Set Background Color',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: changeColor,
                                          onColorChanged: (Color value) {
                                            changeColor = value;
                                          },
                                          pickerAreaHeightPercent: 0.8,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK')),
                                      ],
                                    );
                                  });
                            },
                            child: editField(height, width,
                                Icons.color_lens_outlined, 'Color'),
                          ),
                          //todo ------------------------> TextColor
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        'Set Background Color',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                          pickerColor: changeTextColor,
                                          onColorChanged: (Color value) {
                                            changeTextColor = value;
                                          },
                                          pickerAreaHeightPercent: 0.8,
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                            onPressed: () {
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text('OK')),
                                      ],
                                    );
                                  });
                            },
                            child: editField(height, width, Icons.format_paint,
                                'Text Color'),
                          ),
                          // todo --------------------------------> FontSize
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                            height: 130,
                                            width: width,
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Slider(
                                                    activeColor:
                                                        const Color(0xff181A20),
                                                    max: 40,
                                                    min: 16,
                                                    divisions: 20,
                                                    value: SliderRange,
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        SliderRange = value;
                                                        update();
                                                      });
                                                    }),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            SliderRange = 22;
                                                          });
                                                          update();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),
                                                    Text(
                                                      'Size',
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.062),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.check)),
                                                  ],
                                                ),
                                              ],
                                            ));
                                      });
                                    });
                              },
                              child: editField(
                                  height, width, Icons.format_size, 'Size')),
                          // todo --------------------------------> lineHeight
                          GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (BuildContext context,
                                              StateSetter setState) {
                                        return Container(
                                            height: 130,
                                            width: width,
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Slider(
                                                    activeColor:
                                                        const Color(0xff181A20),
                                                    max: 10,
                                                    min: 0,
                                                    divisions: 10,
                                                    value: lineHeight,
                                                    onChanged: (double value) {
                                                      setState(() {
                                                        lineHeight = value;
                                                        update();
                                                      });
                                                    }),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            lineHeight = 0;
                                                          });
                                                          update();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close)),
                                                    Text(
                                                      'Line Height',
                                                      style: TextStyle(
                                                          fontSize:
                                                              width * 0.062),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {});
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.check)),
                                                  ],
                                                ),
                                              ],
                                            ));
                                      });
                                    });
                              },
                              child: editField(
                                  height, width, Icons.height, 'Height')),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //todo ---------------------------------> Text Alignment
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                        height: 130,
                                        width: width,
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        align = TextAlign.left;
                                                      });
                                                      update();
                                                    },
                                                    icon: Icon(Icons
                                                        .format_align_left,size: width * 0.075)),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        align =
                                                            TextAlign.center;
                                                      });
                                                      update();
                                                    },
                                                    icon: Icon(Icons
                                                        .format_align_center,size: width * 0.075)),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        align = TextAlign.right;
                                                      });
                                                      update();
                                                    },
                                                    icon: Icon(Icons
                                                        .format_align_right,size: width * 0.075)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        align = TextAlign.center;
                                                      });
                                                      update();
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.close)),
                                                Text(
                                                  'Alignment',
                                                  style: TextStyle(
                                                      fontSize: width * 0.062),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {});
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.check)),
                                              ],
                                            ),
                                          ],
                                        ));
                                  });
                            },
                            child: editField(height, width,
                                Icons.format_align_center_rounded, 'Align'),
                          ),
                          // todo --------------------------------> FontFamily
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 220,
                                          width: width,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                width: width,
                                                height: 110,
                                                child: SingleChildScrollView(
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    children: List.generate(
                                                      fonts.length,
                                                      (index) =>
                                                          GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            fontFamily =
                                                                fonts[index];
                                                          });
                                                          update();
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.095,
                                                          width: width * 0.28,
                                                          margin:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 12.5,
                                                                  left: 12.5),
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 10,
                                                                  right: 10),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .grey,
                                                                  blurRadius: 7,
                                                                  spreadRadius:
                                                                      1,
                                                                  offset:
                                                                      Offset(0,
                                                                          0)),
                                                            ],
                                                          ),
                                                          child: Text(
                                                            'Quotes',
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    fonts[
                                                                        index],
                                                                fontSize:
                                                                    width *
                                                                        0.062),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          fontFamily = 'gc_m';
                                                        });
                                                        update();
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.close)),
                                                  Text(
                                                    'Fonts',
                                                    style: TextStyle(
                                                        fontSize: width * 0.06),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {});
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.check)),
                                                ],
                                              ),
                                            ],
                                          ));
                                    });
                                  });
                            },
                            child: editField(height, width,
                                Icons.font_download_sharp, 'Fonts'),
                          ),
                          editField(height, width, Icons.add_photo_alternate,
                              'Image'),
                          editField(height, width, Icons.opacity, 'Opacity'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column editField(double height, double width, var icon, String data) {
  return Column(
    children: [
      Container(
        height: height * 0.065,
        width: width * 0.17,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: Colors.white70)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      Text(
        data,
        style: TextStyle(color: Colors.white, fontSize: width * 0.04),
      )
    ],
  );
}

var align = TextAlign.center;
String fontFamily = 'gc_m';
int editQuoteIndex = 0;
Color changeColor = Colors.black54;
Color changeTextColor = Colors.white;
double SliderRange = 22, lineHeight = 0;
List fonts = [
  'garamond',
  'mali',
  'seasen',
  'klee',
  'kurale',
  'spin',
  'arbut',
  'b612',
  'petit',
  'cormorant',
];