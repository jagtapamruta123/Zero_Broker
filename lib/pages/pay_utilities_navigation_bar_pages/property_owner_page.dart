//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PropertyOwnerPage extends StatefulWidget {
  static String id = 'property_owner';

  @override
  _PropertyOwnerPageState createState() => _PropertyOwnerPageState();
}

class _PropertyOwnerPageState extends State<PropertyOwnerPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'For Property Owner',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 190,
        child: Card(
          elevation: 10,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                    colors: [
                  Colors.blue[200],
                  Colors.white,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextWidget(
                  title: 'List Your Place on ZeroBroker.in',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: CardTextWidget(
                    line: 'faster and verified tenants/Buyers',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: CardTextWidget(
                    line: 'faster and verified tenants/Buyers',
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                FlatButtonWidget(
                  // minWidth: 30,
                  buttonTitle: 'Post New Property Ad for FREE',
                  color: Colors.pink,
                  onPressFlatButton: () {},
                ),
                Divider(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Row(
                      children: [
                        CustomTextWidget(
                          title: 'Why advertise on ZeroBroker',
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
