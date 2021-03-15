//import 'dart:js';

import 'package:demo/pages/property_pages/location_page.dart';
import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RentDetailsStepTwoPage extends StatefulWidget {
  @override
  _RentDetailsStepTwoPageState createState() => _RentDetailsStepTwoPageState();
}

enum Properties { OnlyRent, OnlyLease }

class _RentDetailsStepTwoPageState extends State<RentDetailsStepTwoPage> {
  String dropdownValue = 'One';
  Properties _selectedProperty = Properties.OnlyRent;

  String selectedIndex;
  DateTime selectedDate = DateTime.now();

  List<String> facingType = ['Don\'t know', 'East', 'West', 'North', 'South'];

  List<String> lstMaintance = ['Maintenace included', 'Maintenace Extra'];
  int _currentStep = 0;
  bool isNegotiable = false;
  // StreamSubscription _locationSubscription;
  String _selectedMaintance;
  String appBarTitle;
  String _selectedFacing;
  TextEditingController dateCtl = TextEditingController();
  // final format = DateFormat("yyyy-MM-dd HH:mm");
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        //  dateCtl.text = DateFormat.yMd().format(selectedDate);
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
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 8, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: dateCtl,
                  decoration: InputDecoration(
                    labelText: "Available From",
                    filled: true,
                    border: InputBorder.none,
                    hintText: "dd/mm/yyyy",
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                    ),
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    dateCtl.text = date.toIso8601String();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextWidget(
                  title: 'Properties available for:',
                  fontSize: 12,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          title: CustomTextWidget(
                            title: 'only rent',
                            fontSize: 16,
                          ),
                          horizontalTitleGap: -8,
                          leading: Radio(
                            value: Properties.OnlyRent,
                            groupValue: _selectedProperty,
                            onChanged: (Properties val) {
                              setState(() {
                                _selectedProperty = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          horizontalTitleGap: -8,
                          title: CustomTextWidget(
                            title: 'only lease',
                            fontSize: 16,
                          ),
                          leading: Radio(
                            value: Properties.OnlyLease,
                            groupValue: _selectedProperty,
                            onChanged: (Properties value) {
                              setState(() {
                                _selectedProperty = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  prefix: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: CustomTextWidget(
                      title: '\u20B9',
                      fontSize: 15,
                    ),
                  ),
                  enable: true,
                  inputType: TextInputType.number,
                  border: InputBorder.none,
                  labelText: 'Expected Rent',
                  hintText: '  Enter Amount',
                  suffix: Container(
                    margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
                    child: CustomTextWidget(
                      title: '/Month ',
                    ),
                  ),
                ),
                ListTile(
                  horizontalTitleGap: -8,
                  title: CustomTextWidget(
                    title: 'Negotiable',
                    fontSize: 14,
                  ),
                  leading: Checkbox(
                    value: isNegotiable,
                    //   tristate: false,
                    onChanged: (bool value) {
                      setState(() {
                        isNegotiable = value;
                        print(isNegotiable);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomDropDownWidget(
                  title: 'Maintanace',
                  hintText: 'Maintanace include..',
                  selectedBHKTpe: _selectedMaintance,
                  dataSource: lstMaintance,
                  onChanged: (value) {
                    setState(() {
                      _selectedMaintance = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedFacing = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Furnishing',
                  hintText: 'Select furnishing type',
                  selectedBHKTpe: _selectedMaintance,
                  dataSource: lstMaintance,
                  onChanged: (value) {
                    setState(() {
                      _selectedMaintance = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedFacing = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Select Parking type',
                  hintText: 'Select Parking type',
                  selectedBHKTpe: _selectedMaintance,
                  dataSource: lstMaintance,
                  onChanged: (value) {
                    setState(() {
                      _selectedMaintance = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedFacing = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Select tanent Type',
                  hintText: 'Select tanent Type',
                  selectedBHKTpe: _selectedMaintance,
                  dataSource: lstMaintance,
                  onChanged: (value) {
                    setState(() {
                      _selectedMaintance = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedFacing = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  enable: true,
                  lines: 4,
                  inputType: TextInputType.text,
                  border: InputBorder.none,
                  labelText: 'Property Description',
                  hintText: 'Tell us more about your property..',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
