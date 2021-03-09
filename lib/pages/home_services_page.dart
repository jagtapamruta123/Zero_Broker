//import 'dart:js';

import 'package:demo/model/bottom_sheet_model.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/support.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/pages/z_b_cash_page.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_service_bottom_navigation/home_service_home_page.dart';
import 'rental_agreement_bottom_navigation_bar_pages/booking.dart';

class HomeServicePage extends StatefulWidget {
  static String id = 'home_services';

  @override
  _HomeServicePageState createState() => _HomeServicePageState();
}

class _HomeServicePageState extends State<HomeServicePage> {
  int _currentIndex = 0;
  List<Widget> _tabs = [
    Visibility(
      visible: true, child: HomeserviceHomePage(),
      // BookNowPage(),
    ),
    NavBookingPage(),
    NavSupportPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.mode_sharp,
                color: Colors.white,
                size: 20,
              ),
              radius: 14,
              backgroundColor: Colors.pink[400],
            ),
            SizedBox(
              width: 7,
            ),
            RichText(
              // locale: ,
              text: TextSpan(
                text: 'ZERO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                    letterSpacing: 0.5),
                children: [
                  TextSpan(
                    text: ' Broker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '  (Home services)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        letterSpacing: 0.5,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ZeroBrokerCashIcon(
              onTapIcon: () => Navigator.pushNamed(
                context,
                ZBCashPage.id,
              ),
            ),
          )
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              backgroundColor: destination.color,
              title: Text(destination.title));
        }).toList(),
      ),
    );
  }
}
