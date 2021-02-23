import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/pay_rent_page.dart';
import 'package:demo/pages/search_localities_page.dart';
import 'package:demo/services/call_msg_service.dart';

import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Broker',
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        SearchLocalities.id: (context) => SearchLocalities(),
        PayRent.id: (context) => PayRent(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(),
    );
  }
}
