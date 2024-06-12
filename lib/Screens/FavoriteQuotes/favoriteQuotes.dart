import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../../utils/global.dart';
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
                            height: height * 0.44,
                            width: width,
                            padding: EdgeInsets.only(bottom: height * 0.0145),
                            margin: const EdgeInsets.fromLTRB(0, 0, 30, 8),
                            decoration: BoxDecoration(
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
                                          height: height * 0.35,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 20, 20, 28),
                                          decoration: BoxDecoration(
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
                                                  fontSize: width * 0.051),
                                            ),
                                          )),
                                    ),
                                    // Container(
                                    //     height: height * 0.35,
                                    //     padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.circular(8), color: Colors.white12),
                                    //     child: Align(
                                    //       alignment: Alignment.bottomCenter,
                                    //       child: Text(
                                    //         textAlign: TextAlign.center,
                                    //         showQuotesList[index]['quotes'],
                                    //         style: TextStyle(
                                    //             color: Colors.white,
                                    //             fontFamily: 'gc_m',
                                    //             fontSize: width * 0.051),
                                    //       ),
                                    //     )),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                  text: likedQuotesList[index]
                                                      ['quotes']),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.copy,
                                            color: buttonColor,
                                            size: width * 0.071,
                                          )),
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
                                          },
                                          icon: Icon(Icons.download,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.share,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      // IconButton(
                                      //     onPressed: () {
                                      //       editQuoteIndex = index;
                                      //       Navigator.of(context)
                                      //           .pushNamed('/editPage');
                                      //     },
                                      //     icon: Icon(Icons.edit,
                                      //         color: buttonColor,
                                      //         size: width * 0.071)),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              showLike[index] = false;
                                              likedQuotesList.removeAt(index);
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
List popularLikeList = List.generate(popularText.length, (index) => [false,false,false,false,false,false,false,false,false,false]);
List motivationLikeList = List.generate(motivationText.length, (index) => [false,false,false,false,false,false,false,false,false,false]);
List feelingLikeList = List.generate(feelingsText.length, (index) => [false,false,false,false,false,false,false,false,false,false]);
List familyLikeList = List.generate(familyText.length, (index) => [false,false,false,false,false,false,false,false,false,false]);
List momentsLikeList = List.generate(momentsText.length, (index) => [false,false,false,false,false,false,false,false,false,false]);
List otherLikeList = List.generate(otherText.length, (index) => [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]);
List showLike = [];
List likedQuotesList = [];
