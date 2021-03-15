//import 'dart:js';

import 'package:demo/pages/property_pages/location_page.dart';
import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AmenitiesDetailStepTwoPage extends StatefulWidget {
  @override
  _AmenitiesDetailStepTwoPageState createState() =>
      _AmenitiesDetailStepTwoPageState();
}

enum GatedQueAns { yes, No }

class _AmenitiesDetailStepTwoPageState
    extends State<AmenitiesDetailStepTwoPage> {
  GatedQueAns _type = GatedQueAns.yes;
  String _gatedBtnValue;
  String _nonVegBtnValue;
  String _gymBtnValue;
  String _selectedWaterSuppy;
  List<String> lstWaterSupply = ['Cooperation', 'Borewell', 'Both'];
  void _handleGatedChange(String value) {
    setState(() {
      _gatedBtnValue = value;
    });
  }

  void _handleNonVegChange(String value) {
    setState(() {
      _nonVegBtnValue = value;
    });
  }

  void _handleGymChange(String value) {
    setState(() {
      _gymBtnValue = value;
    });
  }

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
          elevation: 6,
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Gated security ?',
                  fontSize: 13,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Yes",
                      groupValue: _gatedBtnValue,
                      onChanged: _handleGatedChange,
                    ),
                    CustomTextWidget(
                      title: 'Yes',
                      fontSize: 13,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Radio<String>(
                      value: "No",
                      groupValue: _gatedBtnValue,
                      onChanged: _handleGatedChange,
                    ),
                    CustomTextWidget(
                      title: 'No',
                      fontSize: 13,
                    ),
                  ],
                ),
                CustomTextWidget(
                  title: 'Non-veg allowed ?',
                  fontSize: 13,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Yes2",
                      groupValue: _nonVegBtnValue,
                      onChanged: _handleNonVegChange,
                    ),
                    CustomTextWidget(
                      title: 'Yes',
                      fontSize: 13,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Radio<String>(
                      value: "No2",
                      groupValue: _nonVegBtnValue,
                      onChanged: _handleNonVegChange,
                    ),
                    CustomTextWidget(
                      title: 'No',
                      fontSize: 13,
                    ),
                  ],
                ),
                CustomTextWidget(
                  title: 'Gym ?',
                  fontSize: 13,
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Yes3",
                      groupValue: _gymBtnValue,
                      onChanged: _handleGymChange,
                    ),
                    CustomTextWidget(
                      title: 'Yes',
                      fontSize: 13,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Radio<String>(
                      value: "No3",
                      groupValue: _gymBtnValue,
                      onChanged: _handleGymChange,
                    ),
                    CustomTextWidget(
                      title: 'No',
                      fontSize: 13,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextFormFieldWidget(
                  border: InputBorder.none,
                  labelText: 'Bathroom(s)',
                  hintText: 'No. of Bathrooms',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  border: InputBorder.none,
                  labelText: 'Balcony(s)',
                  hintText: 'No. of Balconies',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Water Supply',
                  hintText: '--Select--',
                  selectedBHKTpe: _selectedWaterSuppy,
                  dataSource: lstWaterSupply,
                  onChanged: (value) {
                    setState(() {
                      _selectedWaterSuppy = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedWaterSuppy = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Who will show this house ?',
                  hintText: '--Select--',
                  selectedBHKTpe: _selectedWaterSuppy,
                  dataSource: lstWaterSupply,
                  onChanged: (value) {
                    setState(() {
                      _selectedWaterSuppy = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedWaterSuppy = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  border: InputBorder.none,
                  labelText: 'Secondory Number',
                  hintText: 'Enter secondery number',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextWidget(
                  title: 'other Amenities',
                  fontSize: 15,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Checkbox(
                              value: false,
                              //   tristate: false,
                              onChanged: (bool value) {
                                setState(() {
                                  // isNegotiable = value;
                                  // print(isNegotiable);
                                });
                              },
                            ),
                            Icon(
                              Icons.watch,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            CustomTextWidget(
                              title: 'Rain Water Harvesting',
                              fontSize: 12,
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RadioItemWidget extends StatelessWidget {
  Function onChanged;
  var val;
  var grpVal;
  String title;
  RadioItemWidget({
    this.onChanged,
    this.val,
    this.grpVal,
    this.title,
    Key key,
  }) : super(key: key);

  // final GatedQueAns _type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: val,
          // GatedQueAns.yes,
          groupValue: grpVal,

          //   tristate: false,
          onChanged: onChanged,
          // (GatedQueAns val) {
          //   _type = val;
          // },
        ),
        CustomTextWidget(
          title: title,
          fontSize: 13,
        ),
        // Spacer(),
        // Radio(
        //   value: val,
        //   // GatedQueAns.yes,
        //   groupValue: grpVal,

        //   //   tristate: false,
        //   onChanged: onChanged,
        //   // (GatedQueAns val) {
        //   //   _type = val;
        //   // },
        // ),
        // CustomTextWidget(
        //   title: title,
        //   fontSize: 13,
        // ),
      ],
    );
  }
}
