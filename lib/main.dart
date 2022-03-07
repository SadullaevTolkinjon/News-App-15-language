import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newanewsapi/model/news_model.dart';
import 'package:newanewsapi/router/routers.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NewsModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      onGenerateRoute: (settings) => RouterGenerator.generateRoute(settings),
    );

  }
}
