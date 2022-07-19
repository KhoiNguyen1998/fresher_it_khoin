import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainng_day1/bloc/user_bloc.dart';
import 'package:flutter_trainng_day1/const/const.dart';
import 'package:flutter_trainng_day1/repository/api_provider.dart';
import 'package:flutter_trainng_day1/screen/homePage.dart';

void main() {
  runApp(BlocProvider<UserBloc>(
    create: (context) => UserBloc(UserProvider()),
    child: MyApp(),
  ));
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
