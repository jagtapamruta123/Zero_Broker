import 'package:demo/model/bottom_sheet_model.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/book_now_home_page.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/booking.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/support.dart';
import 'package:demo/pages/z_b_cash_page.dart';

import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'movers_and_packers_navigation_bar/movers_and_packers_home_page.dart';

class PackersAnsMoversPage extends StatefulWidget {
  static String id = 'packers_and_movers';

  // PackersAnsMoversPage();

  @override
  _PackersAnsMoversPageState createState() => _PackersAnsMoversPageState();
}

class _PackersAnsMoversPageState extends State<PackersAnsMoversPage> {
  int _currentIndex = 0;
  // bool isBookNowState = widget.isBookNow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List<Widget> _tabs = [
    MPHomePage(),
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
              width: 5,
            ),
            RichText(
              // locale: ,
              text: TextSpan(
                text: 'ZERO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black,
                    letterSpacing: 0.2),
                children: [
                  TextSpan(
                    text: ' Broker',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        letterSpacing: 0.2,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: ' (Movers and Packers)',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        letterSpacing: 0.2,
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

class PressToCallRentalAgreementPage extends StatelessWidget {
  PressToCallRentalAgreementPage({
    Key key,
    @required this.mobileNumber,
    @required this.onTap,
  }) : super(key: key);

  final String mobileNumber;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: Colors.pink,
          ),
        ),
        margin: EdgeInsets.fromLTRB(5, 18, 10, 0),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.phone,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                mobileNumber,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
