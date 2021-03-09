//import 'dart:js';

import 'package:demo/model/bottom_sheet_model.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/support.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/pages/z_b_cash_page.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home_service_bottom_navigation/home_service_home_page.dart';
import 'pay_utilities_navigation_bar_pages/pay_nav_home_page.dart';
import 'pay_utilities_navigation_bar_pages/pay_utilities_history_page.dart';
import 'rental_agreement_bottom_navigation_bar_pages/booking.dart';

class PayUtilityMainPage extends StatefulWidget {
  static String id = 'pay_utilities';

  @override
  _PayUtilityMainPageState createState() => _PayUtilityMainPageState();
}

class _PayUtilityMainPageState extends State<PayUtilityMainPage> {
  int _currentIndex = 0;
  List<Widget> _tabs = [
    Visibility(
      visible: true, child: PayUtilityBillsPage(),
      // BookNowPage(),
    ),
    PayUtilityHistoryPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:
      //   actions: [],
      // ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                // color: kGoodLightGray,
              ),
              title: Text('HOME'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book_outlined,
                // color: kGoodLightGray,
              ),
              title: Text('HISTORY'),
            ),
          ]),
    );
  }
}
