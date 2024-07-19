import 'package:flutter/material.dart';
import 'package:quotes/screen/detail/view/detail_screen.dart';
import 'package:quotes/screen/home/view/home_screen.dart';
import 'package:quotes/screen/quote/view/quote_screen.dart';
import 'package:quotes/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder>app_routes={
  '/':(context)=>SplashScreen(),
  'home':(context)=>HomeScreen(),
  'quote':(context)=>QuoteScreen(),
  'detail':(context)=>DetailScreen(),
};