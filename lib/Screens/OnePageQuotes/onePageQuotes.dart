import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../ModelData/listFile.dart';
import '../../utils/global.dart';
import '../FavoriteQuotes/favoriteQuotes.dart';
import '../quotesPages/showquotes.dart';

class OnePageQuotes extends StatefulWidget {
  const OnePageQuotes({super.key});

  @override
  State<OnePageQuotes> createState() => _OnePageQuotesState();
}

class _OnePageQuotesState extends State<OnePageQuotes> {
  @override
  void initState(){
    super.initState();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: randomQuotes.length,
          itemBuilder: (context, index) => Stack(
            children: [
              RepaintBoundary(
                key: keyList[index],
                child: Container(
                  height: height,
                  width: width,
                  padding: const EdgeInsets.fromLTRB(27, 20, 27, 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(showImages[index % showImages.length]),
                        fit: BoxFit.cover),
                  ),
                  //todo -------------------------> Quotes
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            bottom: height * 0.12, top: height * 0.22),
                        width: width * 0.82,
                        child: Text(
                          randomQuotes[index]['quotes'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.062,
                              fontFamily: 'gc_m'),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '- ${randomQuotes[index]['author']}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.057,
                              fontFamily: 'gc_m',
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                padding: const EdgeInsets.fromLTRB(27, 20, 27, 20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(showImages[index % showImages.length]),
                      fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    //todo -------------------------> Top 2 Buttons
                    Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: bottomButton(height - 30, width - 30,
                                Icons.arrow_back_ios, Colors.white),
                          ),
                          GestureDetector(
                              onTap: () {
                                Clipboard.setData(
                                  ClipboardData(
                                      text: randomQuotes[index]['quotes']),
                                );
                              },
                              child: bottomButton(
                                  height, width, Icons.copy, Colors.white)),
                        ],
                      ),
                    ),
                    //todo -------------------------> Quotes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: height * 0.12, top: height * 0.22),
                          width: width * 0.82,
                          child: Text(
                            randomQuotes[index]['quotes'],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.062,
                                fontFamily: 'gc_m'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '- ${randomQuotes[index]['author']}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.057,
                                fontFamily: 'gc_m',
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                    //todo -------------------------> Bottom Buttons
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //todo ----------> set WallPaper
                          bottomButton(height, width, Icons.image_outlined,
                              Colors.white),
                          //todo ----------> Download
                          GestureDetector(
                              onTap: () async {
                                RenderRepaintBoundary boundary = keyList[index]
                                        .currentContext!
                                        .findRenderObject()
                                    as RenderRepaintBoundary;
                                ui.Image image = await boundary.toImage();
                                ByteData? byteData = await (image.toByteData(
                                    format: ui.ImageByteFormat.png));
                                Uint8List img = byteData!.buffer.asUint8List();
                                ImageGallerySaver.saveImage(img);
                              },
                              child: bottomButton(height, width,
                                  Icons.file_download_outlined, Colors.white)),
                          //todo ----------> Share
                          GestureDetector(
                            onTap: () async {
                              RenderRepaintBoundary boundary =
                              keyList[index]
                                  .currentContext!
                                  .findRenderObject()
                              as RenderRepaintBoundary;
                              ui.Image image =
                              await boundary.toImage();
                              ByteData? byteData =
                              await (image.toByteData(
                                  format: ui
                                      .ImageByteFormat.png));
                              Uint8List img =
                              byteData!.buffer.asUint8List();
                              final path = await getApplicationDocumentsDirectory();
                              File file = File("${path.path}/img.png");
                              file.writeAsBytes(img);
                              ShareExtend.share(file.path,"image");
                            },
                            child: bottomButton(
                                height, width, Icons.share, Colors.white),
                          ),
                          //todo ----------> Like
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showLike[index] = !showLike[index];
                                if (showLike[index]) {
                                  likedQuotesList
                                      .add(randomQuotes[index]['quotes']);
                                } else {
                                  likedQuotesList
                                      .remove(randomQuotes[index]['quotes']);
                                }
                              });
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  height: width * 0.166,
                                  width: width * 0.166,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.12),
                                  ),
                                  child: Icon(
                                    (showLike[index] == true)
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: (showLike[index] == true)
                                        ? Colors.red
                                        : Colors.white,
                                    size: width * 0.075,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
List showLike = List.generate(randomQuotes.length, (index) => false);

ClipOval bottomButton(double height, double width, var icon, Color color) {
  return ClipOval(
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: Container(
        height: width * 0.166,
        width: width * 0.166,
        padding: (icon == Icons.arrow_back_ios)
            ? const EdgeInsets.only(left: 12)
            : const EdgeInsets.all(0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.12),
        ),
        child: Icon(
          icon,
          color: color,
          size: width * 0.074,
        ),
      ),
    ),
  );
}
