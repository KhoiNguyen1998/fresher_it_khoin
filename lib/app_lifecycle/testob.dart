import 'package:flutter/material.dart';

class AppSystemManagement extends StatefulWidget {
  AppSystemManagement({Key? key}) : super(key: key);

  @override
  State<AppSystemManagement> createState() => _AppSystemManagementState();
}

class _AppSystemManagementState extends State<AppSystemManagement>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print('join');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('$state');
    if (state == AppLifecycleState.inactive) {
      print('add transitioning to other state');
    } else if (state == AppLifecycleState.paused) {
      print('app is on the background');
    } else if (state == AppLifecycleState.detached) {
      print('flutter is running but detached from views');
    } else if (state == AppLifecycleState.resumed) {
      print('app is visible and running');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
    print('out');
  }
}
