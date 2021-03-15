//import 'dart:js';

import 'package:demo/pages/property_pages/property_details.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:demo/widget/bottom_navigation__buton.dart';
// import 'package: _picker/image_picker.dart';

class PostNewPropertyPage extends StatefulWidget {
  static String id = 'post_new_property';

  @override
  _PostNewPropertyPageState createState() => _PostNewPropertyPageState();
}

class _PostNewPropertyPageState extends State<PostNewPropertyPage>
    with SingleTickerProviderStateMixin {
  String _selectedCity;
  TabController _tabController;

  bool isSelected = false;
  List commercialTypes = ['rent', 'sale'];
  List residencialTypes = ['rent', 'sale', 'PG/Hostel', 'Flatmates'];
  int index = 0;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post New Property',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Save and Continue',
        onTap: () => Navigator.pushNamed(
          context,
          PropertyDetailsPage.id,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropDownFormField(
            filled: false,
            //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            titleText: 'city',
            errorText: 'please select city',
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
            height: 25,
          ),
          TabBar(
            // indicatorColor: Colors.transparent,
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.blue,

            tabs: [
              Tab(
                child: Container(
                  //  width: 300,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Residencial"),
                  ),
                ),
              ),
              Tab(
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[200]
                      // borderRadius: BorderRadius.circular(50),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 1,
                      // ),
                      ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Commertial"),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16, 0, 20, 0),
            height: 175,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          title: 'select Property ad Type',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: residencialTypes
                              .map(
                                (title) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      print(title);
                                      title = isSelected = true;
                                      isSelected = !isSelected;
                                      print(title);
                                      print(isSelected);
                                    });
                                  },
                                  child: Wrap(
                                    children: [
                                      SizedBox(
                                        width: 4.5,
                                      ),
                                      (Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                          color: isSelected
                                              ? Colors.green
                                              : Colors.grey[100],
                                        ),
                                        width: 75,
                                        height: 40,
                                        child: Center(
                                          child: CustomTextWidget(
                                            title: title,
                                          ),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        CustomTextWidget(
                          title: 'select Property ad Type',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: commercialTypes
                              .map(
                                (title) => Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      width: 70,
                                      height: 40,
                                      // height:
                                      //     MediaQuery.of(context).size.height / 4,
                                      child: Center(
                                        child: CustomTextWidget(
                                          title: title,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
