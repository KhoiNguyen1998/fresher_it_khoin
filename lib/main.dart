import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trainng_day1/const/const.dart';
import 'package:flutter_trainng_day1/data/repository/user_repo.dart';
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
        home: RepositoryProvider(
          create: (context) => UserRepo(),
          child: MyHomePage(),
        )
        // AppSystemManagement(),

        );
  }
}
