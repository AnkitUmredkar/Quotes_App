import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';
import '../../ModelData/listFile.dart';
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
    // Timer.periodic(const Duration(seconds: 1), (timer){
      setState(() {});
    // });
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
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
                            AssetImage(wallPaperImgList[index]),
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
                              shadows: const [
                                Shadow(
                                  offset: Offset(-2, -2),
                                  blurRadius: 11,
                                  color: Colors.black54,
                                ),
                                Shadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 11,
                                  color: Colors.black54,
                                ),
                              ],
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
                              shadows: const [
                                Shadow(
                                  offset: Offset(-2, -2),
                                  blurRadius: 11,
                                  color: Colors.black54,
                                ),
                                Shadow(
                                  offset: Offset(3, 3),
                                  blurRadius: 11,
                                  color: Colors.black54,
                                ),
                              ],
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
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(wallPaperImgList[index]),
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
                          //todo ------------------------> Set WallPaper
                          GestureDetector(
                              onTap: () {
                                int SelectedIndex = index;
                                  showModalBottomSheet(context: context, builder: (context){
                                    return Container(
                                        width: width,
                                        height: height,
                                        padding: const EdgeInsets.all(18),
                                        child: SingleChildScrollView(
                                          physics: const BouncingScrollPhysics(),
                                          child: Wrap(
                                              spacing: 10,
                                              children: List.generate(options.length, (index) => GestureDetector(
                                                onTap: (){setState(() {
                                                  wallPaperImgList[SelectedIndex] = options[index];
                                                });},child: Container(
                                                  height: height / 4.2,
                                                  width: width / 3.5,
                                                  margin: const EdgeInsets.only(bottom: 12),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                        image: AssetImage(options[index]),
                                                        fit: BoxFit.cover
                                                    ),
                                                  ),
                                                ),
                                              ),)

                                          ),
                                        ),
                                      );
                                  });
                              },
                              child: bottomButton(
                                  height, width, Icons.image_outlined, Colors.white)),
                        ],
                      ),
                    ),
                    //todo -------------------------> Quotes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: height * 0.12, top: height * 0.22,left: 7,right: 7),//l and r: width * 0.019
                          width: width * 0.82,
                          child: Text(
                            randomQuotes[index]['quotes'],
                            style: TextStyle(
                                shadows: const [
                                  Shadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 11,
                                    color: Colors.black54,
                                  ),
                                  Shadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 11,
                                    color: Colors.black54,
                                  ),
                                ],
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
                                shadows: const [
                                  Shadow(
                                    offset: Offset(-2, -2),
                                    blurRadius: 11,
                                    color: Colors.black54,
                                  ),
                                  Shadow(
                                    offset: Offset(3, 3),
                                    blurRadius: 11,
                                    color: Colors.black54,
                                  ),
                                ],
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
                          //todo ----------> Copy
                          GestureDetector(
                            onTap: (){
                                Clipboard.setData(
                                  ClipboardData(
                                      text: randomQuotes[index]['quotes']),
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
                            child: bottomButton(height, width, Icons.copy,
                                Colors.white),
                          ),
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
                          //todo ----------> Like Button
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showOnePageLike[index] = !showOnePageLike[index];
                                if (showOnePageLike[index]) {
                                  likedQuotesList
                                      .add(randomQuotes[index]['quotes']);
                                  likedQuotesImg.add(wallPaperImgList[index]);
                                  Fluttertoast.showToast(
                                    msg: 'Add To Favorites',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16,
                                  );
                                } else {
                                  likedQuotesList
                                      .remove(randomQuotes[index]['quotes']);
                                  likedQuotesImg.remove(wallPaperImgList[index]);
                                  Fluttertoast.showToast(
                                    msg: 'Remove To Favorites',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.black,
                                    textColor: Colors.white,
                                    fontSize: 16,
                                  );
                                }

                              });
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                                child: Container(
                                  height: width * 0.166,
                                  width: width * 0.166,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.12),
                                  ),
                                  child: Icon(
                                    (showOnePageLike[index] == true)
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: (showOnePageLike[index] == true)
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
List wallPaperImgList = [
  'assets/images/WallpaperImages/36.jpg',
  'assets/images/WallpaperImages/1.jpg',
  'assets/images/WallpaperImages/2.jpg',
  'assets/images/WallpaperImages/4.jpg',
  'assets/images/WallpaperImages/5.jpg',
  'assets/images/WallpaperImages/6.jpg',
  'assets/images/WallpaperImages/7.jpg',
  'assets/images/WallpaperImages/8.jpg',
  'assets/images/WallpaperImages/9.jpg',
  'assets/images/WallpaperImages/10.jpg',
  'assets/images/WallpaperImages/11.jpg',
  'assets/images/WallpaperImages/12.jpg',
  'assets/images/WallpaperImages/13.jpg',
  'assets/images/WallpaperImages/14.jpg',
  'assets/images/WallpaperImages/15.jpg',
  'assets/images/WallpaperImages/22.jpg',
  'assets/images/WallpaperImages/23.jpg',
  'assets/images/WallpaperImages/24.jpg',
  'assets/images/WallpaperImages/26.jpg',
  'assets/images/WallpaperImages/27.jpg',
  'assets/images/WallpaperImages/28.jpg',
  'assets/images/WallpaperImages/29.jpg',
  'assets/images/WallpaperImages/30.jpg',
  'assets/images/WallpaperImages/31.jpg',
  'assets/images/WallpaperImages/32.jpg',
  'assets/images/WallpaperImages/33.jpg',
  'assets/images/WallpaperImages/34.jpg',
  'assets/images/WallpaperImages/35.jpg',
];


List options = [
  'assets/images/WallpaperImages/38.jpg',
  'assets/images/WallpaperImages/39.jpg',
  'assets/images/WallpaperImages/40.jpg',
  'assets/images/WallpaperImages/41.jpg',
  'assets/images/WallpaperImages/42.jpg',
  'assets/images/WallpaperImages/43.jpg',
  'assets/images/WallpaperImages/44.jpg',
  'assets/images/WallpaperImages/45.jpg',
  'assets/images/WallpaperImages/46.jpg',
  'assets/images/WallpaperImages/36.jpg',
  'assets/images/WallpaperImages/1.jpg',
  'assets/images/WallpaperImages/2.jpg',
  'assets/images/WallpaperImages/3.jpg',
  'assets/images/WallpaperImages/4.jpg',
  'assets/images/WallpaperImages/5.jpg',
  'assets/images/WallpaperImages/6.jpg',
  'assets/images/WallpaperImages/7.jpg',
  'assets/images/WallpaperImages/8.jpg',
  'assets/images/WallpaperImages/9.jpg',
  'assets/images/WallpaperImages/10.jpg',
  'assets/images/WallpaperImages/11.jpg',
  'assets/images/WallpaperImages/12.jpg',
  'assets/images/WallpaperImages/13.jpg',
  'assets/images/WallpaperImages/14.jpg',
  'assets/images/WallpaperImages/15.jpg',
  'assets/images/WallpaperImages/16.jpg',
  'assets/images/WallpaperImages/17.jpg',
  'assets/images/WallpaperImages/18.jpg',
  'assets/images/WallpaperImages/19.jpg',
  'assets/images/WallpaperImages/20.jpg',
  'assets/images/WallpaperImages/21.jpg',
  'assets/images/WallpaperImages/22.jpg',
  'assets/images/WallpaperImages/23.jpg',
  'assets/images/WallpaperImages/24.jpg',
  'assets/images/WallpaperImages/26.jpg',
  'assets/images/WallpaperImages/27.jpg',
  'assets/images/WallpaperImages/28.jpg',
  'assets/images/WallpaperImages/29.jpg',
  'assets/images/WallpaperImages/30.jpg',
  'assets/images/WallpaperImages/31.jpg',
  'assets/images/WallpaperImages/32.jpg',
  'assets/images/WallpaperImages/33.jpg',
  'assets/images/WallpaperImages/34.jpg',
  'assets/images/WallpaperImages/35.jpg',
  'assets/images/WallpaperImages/37.jpg',
];