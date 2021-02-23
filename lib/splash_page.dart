import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Color backgroundColor = Colors.pink;
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final splashDelay = 5;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  // _loadView() async {
  //   var _duration = Duration(seconds: splashDelay);
  //   return Timer(_duration, navigationPage);
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}
