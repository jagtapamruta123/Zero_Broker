import 'package:flutter/material.dart';

import 'pages/property_pages/property_details.dart';
import 'widget/custom_text_widget.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                labelText: 'Email',
                hintText: '  Enter you email id',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
