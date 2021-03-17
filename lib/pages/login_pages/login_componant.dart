import 'dart:async';

import 'package:demo/pages/home_page.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import '../property_pages/property_details.dart';
import '../../widget/custom_text_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class LoginPage extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = FirebaseAuth.instance;

  String email;
  String password;
  AccessToken _accessToken;
  bool isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  _loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        Uri uri = Uri.https('',
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final graphResponse = await http.get(uri);
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => isLoggedIn = false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 40,
              child: CustomTextFormFieldWidget(
                enable: true,
                align: TextAlign.center,
                inputType: TextInputType.emailAddress,
                border: OutlineInputBorder(),
                onChanged: (value) {
                  email = value;
                },
                labelText: 'Email',
                hintText: '  Enter your email id',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              child: CustomTextFormFieldWidget(
                enable: true,
                align: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                inputType: TextInputType.emailAddress,
                border: OutlineInputBorder(),
                labelText: 'password ',
                hintText: 'eNTER password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButtonWidget(
              buttonTitle: 'Login',
              minWidth: double.infinity,
              color: Colors.pink,
              onPressFlatButton: () async {
                // print(email);
                // print(password);
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null) {
                    Navigator.pushNamed(context, MyHomePage.id);
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
            FlatButtonWidget(
              buttonTitle: 'SignIn With Facebook',
              minWidth: double.infinity,
              color: Colors.pink,
              onPressFlatButton: () {
                _loginWithFB();
              },
            )
          ],
        ),
      ),
    );
  }
}
