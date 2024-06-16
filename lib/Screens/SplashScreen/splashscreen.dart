import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quotes_app/Screens/HomPage/homepage.dart';

double width = 0;

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween<double>(begin: 0, end: 0).animate(animationController!);

    animationController!.addListener(() {
      setState(() {});
    });
    animationController!.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    animation = Tween<double>(begin: width * 0.063, end: width * 0.114).animate(animationController!);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: Text(
            'Quotes',
            style: TextStyle(
              fontSize: animation!.value,
              color: Colors.white,
              fontFamily: 'gc_m',
            ),
          ),
        ),
      ),
    );
  }
}
