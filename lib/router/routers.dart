
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newanewsapi/pages/homepage.dart';
import 'package:newanewsapi/model/news_model.dart';
import 'package:newanewsapi/pages/info_page.dart';

class RouterGenerator {
  static generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => Homepage());
         case "/info":
        return MaterialPageRoute(builder: (context) => InfoPAge(data: args ,));
    }
  }
}
