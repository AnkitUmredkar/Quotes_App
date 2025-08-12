import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/ModelData/listFile.dart';
import 'package:quotes_app/Screens/HomPage/homepage.dart';
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
  void initState(){
    setState(() {
    });
    super.initState();
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
          child:  Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(width * 0.0355),
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
                padding: EdgeInsets.all(width * 0.0355),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.white, size: width * 0.08),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()),
                        );
                      },
                    ),),
              ),
              (likedQuotesList.isEmpty) ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text('There is where you will see your liked quotes',
                      textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.white70,
                          fontSize: width * 0.06,
                          fontFamily: 'gc_m'
                      ),),
                  )
              ) : Padding(
                padding: const EdgeInsets.only(top: 58, bottom: 20),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: likedQuotesList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 25),
                          Container(
                            width: width,
                            margin: EdgeInsets.fromLTRB(width * 0.06, 0, width * 0.06, 8),
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
                                      key: favKeyList[index],
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
                                              borderRadius:
                                              BorderRadius.circular(8),
                                              color: Colors.white12),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              likedQuotesList[index]['quotes'],
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
                                            likedQuotesList[index]['quotes'],
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
                                            favKeyList[index]
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
                                            favKeyList[index]
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
                                      //todo --------------------------------------> Edit
                                      IconButton(
                                          onPressed: () {
                                            imgIndexForEdit =
                                            likedQuotesImg[index];
                                            editQuoteIndex = index;
                                            quote = likedQuotesList[index]['quotes'];
                                            Navigator.of(context)
                                                .pushNamed('/editPage');
                                          },
                                          icon: Icon(Icons.edit,
                                              color: buttonColor,
                                              size: width * 0.071)),
                                      //todo --------------------------------------> Like
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              for(int i=0; i<randomOnePageQuotes.length; i++){
                                                if(likedQuotesList[index]['quotes'] == randomOnePageQuotes[i]['quotes']){
                                                  showOnePageLike[i] = false;
                                                }
                                              }

                                              for(int i=0; i<randomHomeQuotes.length; i++){
                                                if(likedQuotesList[index]['quotes'] == randomHomeQuotes[i]['quotes']){
                                                  randomLikeList[i] = false;
                                                }
                                              }

                                              for(int i=0; i<allQuotesList.length; i++){
                                                //todo  ----------------------------->  Popular
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Love  '){
                                                  popularLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Life  '){
                                                  popularLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Work  '){
                                                  popularLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Mother  '){
                                                  popularLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Friendship  '){
                                                  popularLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Motivate  '){
                                                  popularLikeList[5][i % 10] = false;
                                                }

                                                //todo  ----------------------------->  Motivational
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Inspiration  '){
                                                  motivationLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Motivation  '){
                                                  motivationLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Courage  '){
                                                  motivationLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Freedom  '){
                                                  motivationLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Intelligence  '){
                                                  motivationLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Knowledge  '){
                                                  motivationLikeList[5][i % 10] = false;
                                                }

                                                //todo  ----------------------------->  Feelings
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Alone  '){
                                                  feelingLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Sad  '){
                                                  feelingLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Trust  '){
                                                  feelingLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Revenge  '){
                                                  feelingLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Attitude  '){
                                                  feelingLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Anger  '){
                                                  feelingLikeList[5][i % 10] = false;
                                                }

                                                //todo  ----------------------------->  Family
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Family  '){
                                                  familyLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Mom  '){
                                                  familyLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Dad  '){
                                                  familyLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Home  '){
                                                  familyLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Friends  '){
                                                  familyLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Parenting  '){
                                                  familyLikeList[5][i % 10] = false;
                                                }

                                                //todo  ----------------------------->  Moments
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Anniversary  '){
                                                  momentsLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Birthday  '){
                                                  momentsLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Romantic  '){
                                                  momentsLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Wedding  '){
                                                  momentsLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Dating  '){
                                                  momentsLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Death  '){
                                                  momentsLikeList[5][i % 10] = false;
                                                }

                                                //todo  ----------------------------->  Other
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'God  '){
                                                  otherLikeList[0][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Age  '){
                                                  otherLikeList[1][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Change  '){
                                                  otherLikeList[2][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Communication  '){
                                                  otherLikeList[3][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Environment  '){
                                                  otherLikeList[4][i % 10] = false;
                                                }
                                                if(allQuotesList[i]['quotes'] == likedQuotesList[index]['quotes'] && likedQuotesList[index]['category'] == 'Dreams  '){
                                                  otherLikeList[5][i % 10] = false;
                                                }
                                              }

                                              favKeyList.removeAt(index);
                                              likedQuotesList.removeAt(index);
                                              likedQuotesImg.removeAt(index);
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
        (index) => [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]);
List showOnePageLike = List.generate(randomOnePageQuotes.length, (index) => false);
List randomLikeList = List.generate(randomHomeQuotes.length, (index) => false);
List showLike = [];
List likedQuotesImg = [],likedQuotesList = [];

