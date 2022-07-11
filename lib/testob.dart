import 'package:flutter/material.dart';

class AppSystemManagement extends StatefulWidget {
  AppSystemManagement({Key? key}) : super(key: key);

  @override
  State<AppSystemManagement> createState() => _AppSystemManagementState();
}

class _AppSystemManagementState extends State<AppSystemManagement>
    with WidgetsBindingObserver {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance!.addObserver(this);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   WidgetsBinding.instance!.removeObserver(this);
  // }

  // late AppLifecycleState _notification;

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   setState(() {
  //     _notification = state;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App system manager'),
      ),
      body: Container(
        child: Center(child: Text('this is text')),
      ),
    );
  }
}
