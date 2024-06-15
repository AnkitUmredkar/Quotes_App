import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/ModelData/listFile.dart';
import 'package:quotes_app/utils/global.dart';
import 'package:share_extend/share_extend.dart';
import '../../ModelData/modelClass.dart';
import '../FavoriteQuotes/favoriteQuotes.dart';
import '../quotesPages/showquotes.dart';

QuotesModel? quotesModel;
GlobalKey imgKey = GlobalKey();

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    quotesModel = QuotesModel.toList(allQuotesList);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(width * 0.0385),
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff1A1A36),
            Colors.black,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quotes',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'gc_m',
                            fontSize: width * 0.078)),
                    // todo -------------------------> TextField
                    Container(
                      height: height * 0.07,
                      margin: const EdgeInsets.only(bottom: 14, top: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff262B31),
                      ),
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff8A98B7),
                          ),
                          hintText: 'Type Something Here',
                          hintStyle: TextStyle(
                              color: const Color(0xff94959B),
                              fontSize: width * 0.046,
                              fontFamily: 'gc_m'),
                        ),
                      ),
                    ),
                    // todo -------------------------> Popular
                    headingOfHomepage(width, 'Most Popular'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          popularImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allPopularPageImages[index];
                              title = popularText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    popularText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = popularLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(popularImage[index]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                Text(
                                  popularText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                ),
                                const SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // todo -------------------------> Motivational
                    headingOfHomepage(width, 'Motivational'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          motivationImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allMotivationPageImages[index];
                              title = motivationText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    motivationText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = motivationLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              motivationImage[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Text(
                                  motivationText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                ),
                                const SizedBox(height: 25),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // todo -------------------------> Random Quotes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        headingOfHomepage(width, 'Random Quotes'),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              getNextIndex++;
                              if (getNextIndex == randomHomeQuotes.length-1) {
                                getNextIndex = 0;
                              }
                            });
                          },
                          child: Text('NEXT',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'gc_m',
                                  fontSize: width * 0.038)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          getNextImg++;
                          if (getNextImg == randomHomeImages.length-1) {
                            getNextImg = 0;
                          }
                        });
                      },
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                RepaintBoundary(
                                  key: imgKey,
                                  child: Container(
                                    height: height * 0.38,
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 20, 22),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                randomHomeImages[getNextImg]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white12),
                                    child:  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        randomHomeQuotes[getNextIndex]['quotes'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'gc_m',
                                          fontSize: width * 0.051,
                                          shadows: const [
                                            Shadow(
                                              offset: Offset(-2, -2),
                                              blurRadius: 16,
                                              color: Colors.black87,
                                            ),
                                            Shadow(
                                              offset: Offset(3, 3),
                                              blurRadius: 16,
                                              color: Colors.black87,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: height * 0.38,
                                  padding:
                                  const EdgeInsets.fromLTRB(20, 20, 20, 22),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              randomHomeImages[getNextImg]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white12),
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      randomHomeQuotes[getNextIndex]['quotes'],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'gc_m',
                                        fontSize: width * 0.051,
                                        shadows: const [
                                          Shadow(
                                            offset: Offset(-2, -2),
                                            blurRadius: 16,
                                            color: Colors.black87,
                                          ),
                                          Shadow(
                                            offset: Offset(3, 3),
                                            blurRadius: 16,
                                            color: Colors.black87,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: height * 0.0145,
                                  top: height * 0.0145),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //todo ----------------------> Copy Button
                                  IconButton(
                                      onPressed: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                              text:
                                                  randomHomeQuotes[getNextIndex]
                                                      ['quotes']),
                                        );
                                        Fluttertoast.showToast(
                                          msg: 'Quote Copied to Clipboard',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
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
                                  //todo ----------------------> Download Button
                                  IconButton(
                                      onPressed: () async {
                                        RenderRepaintBoundary boundary = imgKey
                                                .currentContext!
                                                .findRenderObject()
                                            as RenderRepaintBoundary;
                                        ui.Image image =
                                            await boundary.toImage();
                                        ByteData? byteData =
                                            await (image.toByteData(
                                                format:
                                                    ui.ImageByteFormat.png));
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
                                  //todo -------------------------> Like Button
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          randomLikeList[getNextIndex] =
                                          !(randomLikeList[getNextIndex]);
                                          if (randomLikeList[getNextIndex]) {
                                            imgKey = GlobalKey();
                                            keyList.add(imgKey);
                                            likedQuotesList.add({'quotes': randomHomeQuotes[getNextIndex]['quotes']},);
                                            likedQuotesImg.add(randomHomeImages[getNextImg]);
                                            Fluttertoast.showToast(
                                              msg: 'Add To Favorites',
                                              toastLength:
                                              Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16,
                                            );
                                          } else {
                                            likedQuotesList.removeAt(getNextIndex);
                                            likedQuotesImg.removeAt(getNextImg);
                                            Fluttertoast.showToast(
                                              msg: 'Remove From Favorites',
                                              toastLength:
                                              Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 2,
                                              backgroundColor: Colors.black,
                                              textColor: Colors.white,
                                              fontSize: 16,
                                            );
                                          }
                                        });
                                      },
                                      icon: Icon(
                                          (randomLikeList[getNextIndex] == true)
                                              ? Icons.favorite_rounded
                                              : Icons
                                              .favorite_border_rounded,
                                          color: (randomLikeList[getNextIndex] == true)
                                              ? Colors.red
                                              : buttonColor,
                                          size: width * 0.071)),
                                  //todo ---------------------------> ShareButoon
                                  IconButton(
                                      onPressed: () async {
                                        RenderRepaintBoundary boundary = imgKey
                                                .currentContext!
                                                .findRenderObject()
                                            as RenderRepaintBoundary;
                                        ui.Image image =
                                            await boundary.toImage();
                                        ByteData? byteData =
                                            await (image.toByteData(
                                                format:
                                                    ui.ImageByteFormat.png));
                                        Uint8List img =
                                            byteData!.buffer.asUint8List();
                                        final path =
                                            await getApplicationDocumentsDirectory();
                                        File file =
                                            File("${path.path}/img.png");
                                        file.writeAsBytes(img);
                                        ShareExtend.share(file.path, "image");
                                      },
                                      icon: Icon(Icons.share,
                                          color: buttonColor,
                                          size: width * 0.071)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // todo -------------------------> Feelings
                    headingOfHomepage(width, 'Feelings'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          feelingsImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allFeelingsPageImages[index];
                              title = feelingsText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    feelingsText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = feelingLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(feelingsImage[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Text(
                                  feelingsText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // todo -------------------------> Family
                    headingOfHomepage(width, 'Family'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          familyImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allFamilyPageImages[index];
                              title = familyText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    familyText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = familyLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(familyImage[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Text(
                                  familyText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // todo -------------------------> Moments
                    headingOfHomepage(width, 'Moments'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          momentsImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allMomentsPageImages[index];
                              title = momentsText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    momentsText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = momentsLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(momentsImage[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Text(
                                  momentsText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    // todo -------------------------> Other
                    headingOfHomepage(width, 'Other'),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          otherImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              showImages = [];
                              showImages = allOtherPageImages[index];
                              title = otherText[index];
                              showQuotesList = [];
                              keyList = [];
                              for (int i = 0;
                                  i < quotesModel!.quoteModelList.length;
                                  i++) {
                                if (quotesModel!.quoteModelList[i].category! ==
                                    otherText[index]) {
                                  imgKey = GlobalKey();
                                  keyList.add(imgKey);
                                  showQuotesList.add({
                                    'quotes':
                                        quotesModel!.quoteModelList[i].quote,
                                    'author':
                                        quotesModel!.quoteModelList[i].author,
                                    'category':
                                    quotesModel!.quoteModelList[i].category,
                                  });
                                }
                              }
                              showLike = otherLikeList[index];
                              Navigator.of(context).pushNamed('/showQuotes');
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: height * 0.13,
                                  width: width * 0.4,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 12, bottom: 4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(otherImage[index]),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                Text(
                                  otherText[index],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'gc_m',
                                      fontSize: width * 0.0443),
                                ),
                                SizedBox(
                                  height: height * 0.105,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //todo -----------------------> Bottom Navigation Bar
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8.5, sigmaY: 8.5),
                    child: Container(
                      height: height * 0.085,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          bottomButton(width, Icons.home, 'Home'),
                          GestureDetector(
                            onTap: () {
                              keyList = [];
                              for (int i = 0; i < randomOnePageQuotes.length; i++) {
                                imgKey = GlobalKey();
                                keyList.add(imgKey);
                              }
                              Navigator.of(context).pushNamed('/onePageQuotes');
                            },
                            child: bottomButton(
                                width, Icons.format_quote_rounded, 'Quotes'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed('/favoriteQuotes');
                            },
                            child: bottomButton(
                                width, Icons.favorite_rounded, 'Favorite'),
                          ),
                          bottomButton(width, Icons.settings, 'Setting'),
                        ],
                      ),
                    ),
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


Column bottomButton(double width, var icon, String data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
        color: (icon == Icons.home) ? const Color(0xffFE9500) : Colors.white,
        size: width * 0.072,
      ),
      Text(
        data,
        style: TextStyle(
            color: Colors.white, fontSize: width * 0.038, fontFamily: 'gc'),
      ),
    ],
  );
}

int getNextIndex = 0, quoteImageIndex = 0, getNextImg = 0;
