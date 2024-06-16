import 'package:flutter/material.dart';
import 'package:quote_app/screens/home/homeScreen.dart';
import 'package:quote_app/screens/imagescreen/imagescreen.dart';
import 'package:quote_app/screens/quote/quotescreen.dart';
import 'package:quote_app/screens/wishscreen/wishscreen.dart';
import '../screens/splash/splashScreen.dart';

class Routes{
  static Map<String, Widget Function(BuildContext)> myRoutes = {
    '/': (context)=> const Splashscreen(),
    '/home': (context)=> const HomeScreen(),
    '/quote': (context)=> const QuoteScreen(),
    '/image': (context)=> const ImageScreen(),
    '/wishs': (context)=> const WishScreen(),
  };
}