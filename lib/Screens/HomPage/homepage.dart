import 'package:flutter/material.dart';
import 'package:quotes_app/utils/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.07,
                margin: const EdgeInsets.only(bottom: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xff262B31)),
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
              Text(
                'Popular',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'gc_m',
                    fontSize: width * 0.062),
              ),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                  popularImage.length,
                  (index) => Column(
                    children: [
                      Container(
                        height: height * 0.13,
                        width: width * 0.3,
                        margin: const EdgeInsets.only(top: 10, right: 12,bottom: 4),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(popularImage[index]), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.red),
                      ),
                      Text(popularText[index],style: TextStyle(color: Colors.white,fontFamily: 'gc_m',fontSize: width * 0.045),)
                    ],
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
