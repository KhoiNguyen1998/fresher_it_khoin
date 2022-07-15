import 'package:flutter/material.dart';
import 'package:flutter_trainng_day1/const/const.dart';
import 'package:flutter_trainng_day1/screen/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: headerColor,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      // AppSystemManagement(),
    );
  }
}
