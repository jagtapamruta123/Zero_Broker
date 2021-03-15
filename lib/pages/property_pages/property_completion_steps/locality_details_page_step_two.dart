//import 'dart:js';

import 'package:demo/pages/property_pages/location_page.dart';
import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddressDetailsStepTwoPage extends StatefulWidget {
  @override
  _AddressDetailsStepTwoPageState createState() =>
      _AddressDetailsStepTwoPageState();
}

class _AddressDetailsStepTwoPageState extends State<AddressDetailsStepTwoPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Save and Continue',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormFieldWidget(
                  border: InputBorder.none,
                  labelText: 'Street/Area/Landmark',
                  hintText: 'please enter street/area..',
                ),
                SizedBox(
                  height: 30,
                ),
                TabSearchBarWidget(
                  filled: true,
                  enableBorder: InputBorder.none,
                  iconSearch: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  function: () {},
                  hintText: 'Search By locality,landmark..',
                ),
                SizedBox(
                  height: 30,
                ),
                ClipRect(
                  child: Container(
                    height: 250,
                    child: MapView(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
