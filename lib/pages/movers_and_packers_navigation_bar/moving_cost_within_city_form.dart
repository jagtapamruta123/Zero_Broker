//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class MovingCostPage extends StatefulWidget {
  static String id = 'moving_cost';

  @override
  _MovingCostPageState createState() => _MovingCostPageState();
}

class _MovingCostPageState extends State<MovingCostPage> {
  String _selectedCity;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Moving Within City',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBar: NavigationButtonWidget(
        onTap: () {},
        title: 'Next',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Select City',
                  fontWeight: FontWeight.bold,
                ),
                DropDownFormField(
                  filled: false,
                  //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  titleText: '',
                  hintText: 'Choose city..',
                  value: _selectedCity,
                  onSaved: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Mumbai",
                      "value": "Mumbai",
                    },
                    {
                      "display": "Pune",
                      "value": "Pune",
                    },
                    {
                      "display": "Latur",
                      "value": "Latur",
                    },
                    {
                      "display": "Bengalore",
                      "value": "Bengalore",
                    },
                    {
                      "display": "Soccer Practice",
                      "value": "Soccer Practice",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextWidget(
                  title: 'Moving From',
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  height: 35,
                  child: TextFormField(
                    // maxLength: 1,
                    //cursorColor: Colors.white,
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Nearest landmark',
                      hintStyle: TextStyle(fontSize: 12),
                      // labelText: 'Nearest landmark',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextWidget(
                  title: 'Floor No',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 100,

                      // width: double.infinity,
                      child: TextFormField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'Enter Floor No.',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 100,

                        //  margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool value) {},
                              ),
                              Text(
                                'Service Lift',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextWidget(
                  title: 'Moving to',
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  height: 35,
                  width: double.infinity,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: false,
                      hintText: 'Nearest landmark',
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                      //  labelText: 'Nearest landmark',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextWidget(
                  title: 'Floor No',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 35,
                      width: 100,

                      // width: double.infinity,
                      child: TextFormField(
                        maxLength: 3,
                        decoration: InputDecoration(
                          filled: false,
                          hintText: 'Enter Floor No.',
                          hintStyle: TextStyle(
                            fontSize: 12,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        width: 100,

                        //  margin: EdgeInsets.fromLTRB(10, 0, 5, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 23),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: false,
                                onChanged: (bool value) {},
                              ),
                              Text(
                                'Service Lift',
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 70,
                  color: Colors.pink[50],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.person,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'If Your building has working service Lift it will be reduce theoverall quote value',
                            maxLines: 5,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 70,
                  color: Colors.pink[50],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 12, 5, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.phone,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Reach out to us at',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    //CALL SERVICE CALLING
                                  },
                                text: ' +91 9637082374 ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              TextSpan(
                                text: 'for Any Issue .We\'re all ears!',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                          ),
                        )
                      ],
                    ),
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
