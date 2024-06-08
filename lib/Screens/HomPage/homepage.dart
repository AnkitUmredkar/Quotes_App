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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // todo -------------------------> TextField
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
                // todo -------------------------> Popular
                headingOfHomepage(width, 'Popular'),
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
                            margin: const EdgeInsets.only(
                                top: 10, right: 12, bottom: 4),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(popularImage[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12),),
                          ),
                          Text(
                            popularText[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'gc_m',
                                fontSize: width * 0.043),
                          ),
                          const SizedBox(height: 25),
                        ],
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
                      (index) => Column(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.3,
                            margin: const EdgeInsets.only(
                                top: 10, right: 12, bottom: 4),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(motivationImage[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Text(
                            motivationText[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'gc_m',
                                fontSize: width * 0.043),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // todo -------------------------> Random Quotes
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingOfHomepage(width, 'Random Quotes'),
                    Text(
                      'NEXT',
                      style: TextStyle(
                          color: Colors.blue,
                          fontFamily: 'gc_m',
                          fontSize: width * 0.038),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 30),
                  height: height * 0.43,
                  width: width,
                  padding: EdgeInsets.only(bottom: height * 0.014),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedContainer(
                        height: height * 0.34,
                        duration: const Duration(milliseconds: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.red),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.copy,
                                color: buttonColor,
                                size: width * 0.071,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.download,
                                  color: buttonColor, size: width * 0.071)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_outline_rounded,
                                  color: buttonColor, size: width * 0.071)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.share,
                                  color: buttonColor, size: width * 0.071)),
                        ],
                      ),
                    ],
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
                          (index) => Column(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.3,
                            margin: const EdgeInsets.only(
                                top: 10, right: 12, bottom: 4),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(feelingsImage[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Text(
                            feelingsText[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'gc_m',
                                fontSize: width * 0.043),
                          )
                        ],
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
                          (index) => Column(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.3,
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
                                fontSize: width * 0.043),
                          )
                        ],
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
                          (index) => Column(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.3,
                            margin: const EdgeInsets.only(
                                top: 10, right: 12, bottom: 4),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(momentsImage[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Text(
                            momentsText[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'gc_m',
                                fontSize: width * 0.043),
                          ),
                        ],
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
                          (index) => Column(
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width * 0.3,
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
                                fontSize: width * 0.043),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
