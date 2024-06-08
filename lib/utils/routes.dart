import 'package:flutter/material.dart';
import '../Screens/HomPage/homepage.dart';

class AppRoutes{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/' : (context) => const HomePage(),
  };
}