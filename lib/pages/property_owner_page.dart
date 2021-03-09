//import 'dart:js';

import 'package:demo/pages/property_pages/post_new_property.dart';
import 'package:demo/pages/property_pages/property_owner_add.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: 175,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ClipRect(
                  child: Banner(
                    message: 'for Rent',
                    location: BannerLocation.topEnd,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                          colors: [
                            Colors.blue[200],
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: 'ONLY DEPOSITE',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[100]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.crop_square,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomTextWidget(
                                        title: 'Inactive',
                                        //fontWeight: FontWeight.b,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                title: '1BHK for rent',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextWidget(
                                title: 'No locality mentioned',
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                              Container(
                                // margin: EdgeInsets.only(left: 80),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FlatButtonWidget(
                                      minWidth: 90,
                                      buttonTitle: 'EDIT',
                                      color: Colors.pink,
                                      onPressFlatButton: () {},
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FlatButtonWidget(
                                        minWidth: 90,
                                        buttonTitle: 'Activate',
                                        color: Colors.pink,
                                        onPressFlatButton: () {}),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            color: Colors.grey[100],
                            width: 80,
                            height: 100,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              size: 50,
                              color: Colors.grey[300],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
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
                        onPressFlatButton: () {
                          Navigator.pushNamed(
                            context,
                            PostNewPropertyPage.id,
                          );
                        }),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PropertyOwnerAddPage.id,
                        );
                      },
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
        ],
      ),
    );
  }
}
