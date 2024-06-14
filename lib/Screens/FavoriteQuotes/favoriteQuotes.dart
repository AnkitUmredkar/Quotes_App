import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../utils/global.dart';
import '../EditPage/editPage.dart';
import '../quotesPages/showquotes.dart';

class FavoriteQuotes extends StatefulWidget {
  const FavoriteQuotes({super.key});

  @override
  State<FavoriteQuotes> createState() => _FavoriteQuotesState();
}

class _FavoriteQuotesState extends State<FavoriteQuotes> {
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
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Favorites',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'gc_m',
                        fontSize: width * 0.072),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.white, size: width * 0.08),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58, bottom: 20, left: 28),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: likedQuotesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 25),
                          Container(
                            width: width,
                            margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
                            decoration: BoxDecoration(
                              boxShadow: const[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: Offset(-2, -2),
                                ),
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 12,
                                  offset: Offset(3, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black54,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    RepaintBoundary(
                                      key: keyList[index],
                                      child: Container(
                                          height: height * 0.38,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 20, 20, 22),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    likedQuotesImg[index]),
                                              ),
                                              borderRadius: BorderRadius.circular(8),
                                              color: Colors.white12),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              likedQuotesList[index].toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'gc_m',
                                                fontSize: width * 0.051,
                                                shadows: const [
                                                  Shadow(
                                                    offset: Offset(-2, -2),
                                                    blurRadius: 16.5,
                                                    color: Colors.black,
                                                  ),
                                                  Shadow(
                                                    offset: Offset(3, 3),
                                                    blurRadius: 16.5,
                                                    color: Colors.black,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Container(
                                        height: height * 0.38,
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 20, 20, 22),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  likedQuotesImg[index]),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            color: Colors.white12),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            likedQuotesList[index].toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'gc_m',
                                              fontSize: width * 0.051,
                                              shadows: const [
                                                Shadow(
                                                  offset: Offset(-2, -2),
                                                  blurRadius: 16.5,
                                                  color: Colors.black,
                                                ),
                                                Shadow(
                                                  offset: Offset(3, 3),
                                                  blurRadius: 16.5,
                                                  color: Colors.black,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 11,
                                      right: 11,
                                      top: height * 0.0145,
                                      bottom: height * 0.0145),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      //todo --------------------------------------> Copy
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                  text: likedQuotesList[index]
                                                  ['quotes']),
                                            );
                                            Fluttertoast.showToast(
                                              msg: 'Text Copied',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            color: buttonColor,
                                            size: width * 0.071,
                                          )),
                                      //todo --------------------------------------> Download
                                      IconButton(
                                          onPressed: () async {
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
                                            ImageGallerySaver.saveImage(img);
                                            Fluttertoast.showToast(
                                              msg: 'Image Saved To Gallery',
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16,
                                            );
                                          },
                                          icon: Icon(Icons.download,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      //todo --------------------------------------> Share
                                      IconButton(
                                          onPressed: () async {
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
                                            final path =
                                            await getApplicationDocumentsDirectory();
                                            File file =
                                            File("${path.path}/img.png");
                                            file.writeAsBytes(img);
                                            ShareExtend.share(
                                                file.path, "image");
                                          },
                                          icon: Icon(Icons.share,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      IconButton(
                                          onPressed: () {
                                            imgIndexForEdit =
                                            likedQuotesImg[index];
                                            editQuoteIndex = index;
                                            Navigator.of(context)
                                                .pushNamed('/editPage');
                                          },
                                          icon: Icon(Icons.edit,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              // print(showLike[index]);
                                              // showLike[index] = false;
                                              // print(showLike[index]);
                                              // likedQuotesImg
                                              //     .remove(showImages[index]);
                                              showLike[index] = false;
                                              likedQuotesList.removeAt(index);
                                              likedQuotesImg.removeAt(index);
                                              // likedQuotesImg.remove(likedQuotesImg[index]);
                                              Fluttertoast.showToast(
                                                msg: 'Remove From Favorites',
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 2,
                                                backgroundColor: Colors.black,
                                                textColor: Colors.white,
                                                fontSize: 16,
                                              );
                                            });
                                          },
                                          icon: Icon(Icons.favorite_rounded,
                                              color: Colors.red,
                                              size: width * 0.071)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List popularLikeList = List.generate(
    popularText.length,
        (index) =>
    [false, false, false, false, false, false, false, false, false, false]);
List motivationLikeList = List.generate(
    motivationText.length,
        (index) =>
    [false, false, false, false, false, false, false, false, false, false]);
List feelingLikeList = List.generate(
    feelingsText.length,
        (index) =>
    [false, false, false, false, false, false, false, false, false, false]);
List familyLikeList = List.generate(
    familyText.length,
        (index) =>
    [false, false, false, false, false, false, false, false, false, false]);
List momentsLikeList = List.generate(
    momentsText.length,
        (index) =>
    [false, false, false, false, false, false, false, false, false, false]);
List otherLikeList = List.generate(
    otherText.length,
        (index) => [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ]);
List showOnePageLike = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
List showLike = [];
List likedQuotesImg = [];
List likedQuotesList = [];
int repeat = 0;
