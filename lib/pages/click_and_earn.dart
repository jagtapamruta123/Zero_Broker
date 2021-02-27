//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

class ClickAndEarn extends StatefulWidget {
  static String id = 'click_and_earn';

  @override
  _ClickAndEarnState createState() => _ClickAndEarnState();
}

class _ClickAndEarnState extends State<ClickAndEarn>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> cities = ['Mumbai', 'Satara', 'Bengalore'];
  var selectedCity;
  var reSale;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Click and Earn',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                  // height: 150,
                  //width: 300,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "get reward of 100 in your ",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: "PAY",
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "TM",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text: " wallet for every property listing we publish",
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 70,
                color: Colors.pink[50],
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      'If Your building has working service Lift it will be reduce theoverall quote value',
                      maxLines: 7,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              TabBar(
                labelColor: Colors.black,
                controller: _tabController,
                tabs: [
                  Tab(
                    text: 'Photo',
                  ),
                  Tab(
                    // icon: Icon(
                    //   Icons.contact_page_sharp,
                    // ),
                    text: 'Owner Details',
                  ),
                ],
              ),
              Container(
                height: 740,
                //flex: 1,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: DropDownFormField(
                              filled: false,
                              //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              titleText: '',
                              hintText: 'Choose city..',
                              value: selectedCity,
                              onSaved: (value) {
                                setState(() {
                                  selectedCity = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedCity = value;
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
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          FlatButtonWidget(
                            buttonTitle: 'Take Photo',
                            onPressFlatButton: () {},
                            color: Colors.pink,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
                            child: Center(
                              child: CustomTextWidget(
                                title: 'Frequently Asked Questions',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 500,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                //  scrollDirection: Axis.vertical,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int count) {
                                  return QuestionAnsExpandedWidget(
                                      que: 'How secure zERO broker PAY?',
                                      ans: 'Security is incredibly important to us, therefore' +
                                          'when you pay on our website ,we use sofisticated security' +
                                          'measure to ensure your confidential information is secure' +
                                          'and encrypted.Zero broker pay');
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: DropDownFormField(
                              filled: false,
                              //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              titleText: '',
                              hintText: 'Choose city..',
                              value: selectedCity,
                              onSaved: (value) {
                                setState(() {
                                  selectedCity = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  selectedCity = value;
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
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 35,
                            child: TextFormField(
                              // maxLength: 1,
                              //cursorColor: Colors.white,
                              decoration: InputDecoration(
                                filled: false,
                                hintText: 'Owner Name',
                                hintStyle: TextStyle(fontSize: 15),
                                // labelText: 'Nearest landmark',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 35,
                            child: TextFormField(
                              // maxLength: 1,
                              //cursorColor: Colors.white,
                              decoration: InputDecoration(
                                filled: false,
                                hintText: 'Owner Contact Number',
                                hintStyle: TextStyle(fontSize: 15),
                                // labelText: 'Nearest landmark',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: DropDownFormField(
                              filled: false,
                              //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              titleText: '',
                              hintText: 'Resale',
                              value: reSale,
                              onSaved: (value) {
                                setState(() {
                                  reSale = value;
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  reSale = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Rent",
                                  "value": "Rent",
                                },
                                {
                                  "display": "PG",
                                  "value": "PG",
                                },
                                {
                                  "display": "Resale",
                                  "value": "Resale",
                                },
                                {
                                  "display": "Commercial Rent",
                                  "value": "Commercial Rent",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          FlatButtonWidget(
                            buttonTitle: 'Take Photo',
                            onPressFlatButton: () {},
                            color: Colors.pink,
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
                            child: Center(
                              child: CustomTextWidget(
                                title: 'Frequently Asked Questions',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                //  scrollDirection: Axis.vertical,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int count) {
                                  return QuestionAnsExpandedWidget(
                                      que: 'How secure zERO broker PAY?',
                                      ans: 'Security is incredibly important to us, therefore' +
                                          'when you pay on our website ,we use sofisticated security' +
                                          'measure to ensure your confidential information is secure' +
                                          'and encrypted.Zero broker pay');
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
