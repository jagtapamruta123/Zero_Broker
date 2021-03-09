//import 'dart:js';

import 'package:demo/pages/home_service_bottom_navigation/select_address_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectApartmentType extends StatefulWidget {
  static String id = 'select_apartment_type';

  @override
  _SelectApartmentTypeState createState() => _SelectApartmentTypeState();
}

class _SelectApartmentTypeState extends State<SelectApartmentType> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.yellow[800],
              child: CircleAvatar(
                radius: 10.5,
                backgroundColor: Colors.yellow[200],
                child: CircleAvatar(
                  radius: 9,
                  child: Text(
                    'N',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.yellow[800],
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Select Apartment Type',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: ListViewCustomWidget(
                onItemClick: () {
                  Navigator.pushNamed(context, SelectAddressPage.id);
                },
                tailing: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  child: Icon(
                    Icons.navigate_next_rounded,
                  ),
                ),
                length: 6,
                title: '1 RK',
                subTitle: '',
                leading: CircleAvatar(
                  backgroundColor: Colors.blue[50],
                  child: Icon(
                    Icons.home_outlined,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
