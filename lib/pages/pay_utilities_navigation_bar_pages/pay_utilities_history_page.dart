//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PayUtilityHistoryPage extends StatefulWidget {
  static String id = 'pay_utility_histoty';

  @override
  _PayUtilityHistoryPageState createState() => _PayUtilityHistoryPageState();
}

class _PayUtilityHistoryPageState extends State<PayUtilityHistoryPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home_outlined,
              size: 40,
            ),
            CustomTextWidget(
              title: 'No transactions found',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextWidget(title: 'We haven\'t found any transaction '),
            SizedBox(
              height: 12,
            ),
            FlatButton(
              color: Colors.pink,
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  RentalAgreementPage.id,
                ),
              },
              child: Text(
                'Book Now',
              ),
            )
          ],
        ),
      ),
    );
  }
}
