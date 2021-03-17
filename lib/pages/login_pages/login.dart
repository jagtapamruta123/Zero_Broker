import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/login_pages/login_componant.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../property_pages/property_details.dart';
import '../../widget/custom_text_widget.dart';

class LogInComponantPage extends StatefulWidget {
  static String id = 'login_page';
  @override
  _LogInComponantPageState createState() => _LogInComponantPageState();
}

class _LogInComponantPageState extends State<LogInComponantPage> {
  // final _auth = FirebaseAuth.instance;
  // static String id = 'main_login';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return LoginPage();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
