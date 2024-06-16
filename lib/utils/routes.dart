import 'package:flutter/material.dart';
import 'package:quotes_app/Screens/SplashScreen/splashscreen.dart';
import '../Screens/EditPage/editPage.dart';
import '../Screens/FavoriteQuotes/favoriteQuotes.dart';
import '../Screens/HomPage/homepage.dart';
import '../Screens/OnePageQuotes/onePageQuotes.dart';
import '../Screens/quotesPages/showquotes.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const Splashscreen(),
    '/HomePage' : (context) => const HomePage(),
    '/showQuotes' : (context) => const ShowQuotes(),
    '/onePageQuotes' : (context) => const OnePageQuotes(),
    '/editPage' : (context) => const EditPage(),
    '/favoriteQuotes' : (context) => const FavoriteQuotes(),
  };
}