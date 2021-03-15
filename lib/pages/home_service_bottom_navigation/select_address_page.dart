//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:demo/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectAddressPage extends StatefulWidget {
  static String id = 'select_address';

  @override
  _SelectAddressPageState createState() => _SelectAddressPageState();
}

class _SelectAddressPageState extends State<SelectAddressPage> {
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
          'Select Your Address',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Continue',
        onTap: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                color: Colors.pink[50],
              ),
              CustomTextFormField(
                label: 'Enter Location/society name',
              ),
              CustomTextFormField(
                label: 'Enter your flat/house no.',
              ),
              CustomTextFormField(
                label: 'Enter your street address',
              ),
              CustomTextFormField(
                label: 'save address as home ,office',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
