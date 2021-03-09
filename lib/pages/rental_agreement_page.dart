import 'package:demo/model/bottom_sheet_model.dart';

import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/book_now_home_page.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/booking.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/support.dart';
import 'package:demo/pages/z_b_cash_page.dart';
import 'package:demo/widget/z_b_icon.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentalAgreementPage extends StatefulWidget {
  static String id = 'rental_agreemet';
  bool isBookNow;
  RentalAgreementPage({this.isBookNow});

  @override
  _RentalAgreementPageState createState() => _RentalAgreementPageState();
}

class _RentalAgreementPageState extends State<RentalAgreementPage> {
  int _currentIndex = 0;
  // bool isBookNowState = widget.isBookNow;

  @override
  void initState() {
    //  isBookNowState = widget.isBookNow;

    // TODO: implement initState
    super.initState();
  }

  List<Widget> _tabs = [
    Visibility(
      visible: false,
      replacement: NavHomePage(),
      child: BookNowPage(),
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
                    text: '  (legal services)',
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
