//import 'dart:js';

import 'dart:async';
import 'dart:typed_data';

import 'package:demo/model/title.dart';
import 'package:demo/pages/property_pages/location_page.dart';
import 'package:demo/pages/property_pages/property_completion_steps/amenities_details_step_four.dart';
import 'package:demo/pages/property_pages/property_completion_steps/locality_details_page_step_two.dart';
import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/pages/property_pages/property_completion_steps/rent_details_page_step_three.dart';
import 'package:demo/pages/property_pages/property_completion_steps/schedular_page_stage_seven.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/services.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'property_completion_steps/property_image_page_stage_five.dart';
import 'property_completion_steps/property_video_stage_six_page.dart';

class PropertyDetailsPage extends StatefulWidget {
  static String id = 'property_details_page';

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

enum Properties { OnlyRent, OnlyLease }

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  Properties _selectedProperty = Properties.OnlyRent;
  String dropdownValue = 'One';
  String _selectedCity;
  String _selectedBHKTpe;
  String _selectedFacing;
  String _selectedPropertyAge;
  String selectedIndex;
  TextEditingController _controller = new TextEditingController();
  TextEditingController _controllerOfFloor = new TextEditingController();
  List<String> cities = ['pune', 'solapur', 'abc', 'mumbai'];
  List<String> bHKType = ['1 RK', '1 BHK', '2 BHK', '3 BHK', '4 BHK', '4+ BHK'];
  List<String> facingType = ['Don\'t know', 'East', 'West', 'North', 'South'];
  List<String> propertyAge = [
    'Under Construction',
    'Less than one year',
    '1-3 year',
    '3-5 year',
    '5-10 year'
  ];
  List<String> lstMaintance = ['Maintenace included', 'Maintenace Extra'];
  int _currentStep = 0;
  bool isCreditInfoAccepted = false;
  StreamSubscription _locationSubscription;
  String _selectedMaintance;
  String appBarTitle;
  List<String> lstTitle = [
    'Property Details',
    'Adress Details' 'Property Details',
    'Adress Details' 'Property Details',
    'Adress Details',
    ''
  ];

  void _openBottomSheet(
    BuildContext context,
    String hintText,
    TextEditingController editingController,
  ) {
    showModalBottomSheet(
      context: context,

      elevation: 10,
      // gives rounded corner to modal bottom screen
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      builder: (
        BuildContext context,
      ) {
        return Container(
          height: 270,
          child: Column(
            children: [
              TabSearchBarWidget(
                filled: true,
                enableBorder: InputBorder.none,
                iconSearch: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 20,
                ),
                function: () {},
                hintText: hintText,
              ),
              Divider(
                color: Colors.black,
              ),
              Container(
                height: 190,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 101,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? InkWell(
                            onTap: () {
                              Navigator.pop(
                                  context, editingController.text = 'ground');
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              height: 30,
                              child: Text(
                                'ground',
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.pop(context,
                                  editingController.text = '$index'.toString());
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              height: 30,
                              child: Text('$index'),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // static final CameraPosition _kGooglePlex = CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  void initState() {
    // TODO: implement initState
    appBarTitle = lstTitle[0];
    print(appBarTitle);
    super.initState();
  }

  void _select(var c) {
    setState(() {
      appBarTitle = c;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 7,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              appBarTitle,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: TabBar(
                tabs: [
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                  Tab(
                    text: '',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              ProgressBarPropertyDetails(),
              AddressDetailsStepTwoPage(),
              RentDetailsStepTwoPage(),
              AmenitiesDetailStepTwoPage(),
              PropertyImagePage(),
              PropertyVideoPage(),
              SchedularPage()
            ],
          )

          //  Padding(
          //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          //   child: Form(
          //     child: SingleChildScrollView(
          //       child: Container(
          //         height: double.maxFinite,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: <Widget>[
          //             SizedBox(
          //               height: 20,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Apartment Type',
          //               hintText: 'Select Apartment Type',
          //               selectedBHKTpe: _selectedCity,
          //               dataSource: cities,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedCity = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedCity = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'BHK Type',
          //               hintText: 'Select BHK Types',
          //               selectedBHKTpe: _selectedBHKTpe,
          //               dataSource: bHKType,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedBHKTpe = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedBHKTpe = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomTextFormFieldWidget(
          //               border: InputBorder.none,
          //               labelText: 'Property Size',
          //               hintText: 'build up area (sq ft)',
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Facing',
          //               hintText: '--Select--',
          //               selectedBHKTpe: _selectedFacing,
          //               dataSource: facingType,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Property Age',
          //               hintText: 'Select Property Age',
          //               selectedBHKTpe: _selectedPropertyAge,
          //               dataSource: propertyAge,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedPropertyAge = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedPropertyAge = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               children: [
          //                 Container(
          //                     width: 150,
          //                     child: InkWell(
          //                       onTap: () => _openBottomSheet(
          //                           context, 'Search Floor', _controller),
          //                       child: CustomTextFormFieldWidget(
          //                         labelText: 'Floor',
          //                         hintText: '--SELECT--',
          //                         controller: _controller,
          //                         enable: false,
          //                         suffix: Icon(
          //                           Icons.arrow_drop_down,
          //                         ),
          //                       ),
          //                     )),
          //                 SizedBox(
          //                   width: 8,
          //                 ),
          //                 CustomTextWidget(
          //                   title: 'OF',
          //                 ),
          //                 SizedBox(
          //                   width: 8,
          //                 ),
          //                 Container(
          //                   width: 150,
          //                   child: InkWell(
          //                     onTap: () => _openBottomSheet(context,
          //                         'Search Total Floor', _controllerOfFloor),
          //                     child: CustomTextFormFieldWidget(
          //                       labelText: 'Floor',
          //                       hintText: '--SELECT--',
          //                       controller: _controllerOfFloor,
          //                       enable: false,
          //                       suffix: Icon(
          //                         Icons.arrow_drop_down,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             Container(
          //               height: 100,
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.start,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   TabSearchBarWidget(
          //                     filled: true,
          //                     enableBorder: InputBorder.none,
          //                     iconSearch: Icon(
          //                       Icons.search,
          //                       color: Colors.grey,
          //                       size: 20,
          //                     ),
          //                     function: () {},
          //                     hintText: 'Search By locality,landmark..',
          //                   ),
          //                   // Container(
          //                   //   height: 200,
          //                   //   child: GoogleMap(
          //                   //     mapType: MapType.hybrid,
          //                   //     initialCameraPosition: _kGooglePlex,
          //                   //     onMapCreated: (GoogleMapController controller) {
          //                   //       _mapController.complete(controller);
          //                   //     },
          //                   //   ),
          //                   // ),
          //                 ],
          //               ),
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomTextWidget(
          //               title: 'Properties available for:',
          //               fontSize: 12,
          //             ),
          //             SizedBox(
          //               height: 5,
          //             ),
          //             Row(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: <Widget>[
          //                 Expanded(
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[200],
          //                     ),
          //                     child: ListTile(
          //                       title: CustomTextWidget(
          //                         title: 'only rent',
          //                         fontSize: 16,
          //                       ),
          //                       leading: Radio(
          //                         value: Properties.OnlyRent,
          //                         groupValue: _selectedProperty,
          //                         onChanged: (Properties value) {
          //                           setState(() {
          //                             _selectedProperty = value;
          //                           });
          //                         },
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //                 Expanded(
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                       color: Colors.grey[200],
          //                     ),
          //                     child: ListTile(
          //                       title: CustomTextWidget(
          //                         title: 'only lease',
          //                         fontSize: 16,
          //                       ),
          //                       leading: Radio(
          //                         value: Properties.OnlyLease,
          //                         groupValue: _selectedProperty,
          //                         onChanged: (Properties value) {
          //                           setState(() {
          //                             _selectedProperty = value;
          //                           });
          //                         },
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomTextFormFieldWidget(
          //               prefix: Text('\u20B9'),
          //               enable: true,
          //               inputType: TextInputType.number,
          //               border: InputBorder.none,
          //               labelText: 'Expected Rent',
          //               hintText: '  Enter Amount',
          //               suffix: Container(
          //                 margin: EdgeInsets.fromLTRB(0, 15, 10, 0),
          //                 child: CustomTextWidget(
          //                   title: '/Month ',
          //                 ),
          //               ),
          //             ),
          //             ListTile(
          //               title: CustomTextWidget(
          //                 title: 'Negotiable',
          //                 fontSize: 14,
          //               ),
          //               leading: Checkbox(
          //                 value: isCreditInfoAccepted,
          //                 onChanged: (bool value) {
          //                   isCreditInfoAccepted = value;
          //                 },
          //               ),
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Maintanace',
          //               hintText: 'Maintanace include..',
          //               selectedBHKTpe: _selectedMaintance,
          //               dataSource: lstMaintance,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedMaintance = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Furnishing',
          //               hintText: 'Select furnishing type',
          //               selectedBHKTpe: _selectedMaintance,
          //               dataSource: lstMaintance,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedMaintance = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Select Parking type',
          //               hintText: 'Select Parking type',
          //               selectedBHKTpe: _selectedMaintance,
          //               dataSource: lstMaintance,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedMaintance = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomDropDownWidget(
          //               title: 'Select tanent Type',
          //               hintText: 'Select tanent Type',
          //               selectedBHKTpe: _selectedMaintance,
          //               dataSource: lstMaintance,
          //               onChanged: (value) {
          //                 setState(() {
          //                   _selectedMaintance = value;
          //                 });
          //               },
          //               onSaved: (value) {
          //                 setState(() {
          //                   _selectedFacing = value;
          //                 });
          //               },
          //             ),
          //             SizedBox(
          //               height: 30,
          //             ),
          //             CustomTextFormFieldWidget(
          //               enable: true,
          //               lines: 4,
          //               inputType: TextInputType.text,
          //               border: InputBorder.none,
          //               labelText: 'Property Description',
          //               hintText: 'Tell us more about your property..',
          //             ),
          //             Container(
          //               child: FlatButton(
          //                 child: Text('press map'),
          //                 onPressed: () =>
          //                     Navigator.pushNamed(context, MapView.id),
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),

          ),
    );
  }
}

class CustomTextFormFieldWidget extends StatelessWidget {
  String labelText;
  String hintText;
  // TextInputType keyBoardType;
  Widget suffix;
  Widget prefix;
  bool enable;
  int lines;
  Function onTAP;
  InputBorder border;
  TextInputType inputType;
  TextEditingController controller;
  TextAlign align;
  InputBorder inputBorder;

  CustomTextFormFieldWidget({
    this.hintText,
    //  this.keyBoardType,
    this.labelText,
    this.suffix,
    this.prefix,
    this.inputType,
    this.border,
    this.lines = 1,
    this.enable = true,
    this.controller,
    this.onTAP,
    this.inputBorder = InputBorder.none,
    this.align = TextAlign.start,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  cursorHeight: 3,
      onTap: onTAP,
      maxLines: lines,
      textAlign: align,
      controller: controller,
      cursorColor: Colors.black,
      enabled: enable,
      enableInteractiveSelection: false,
      textDirection: TextDirection.ltr,
      autofocus: false,

      decoration: InputDecoration(
        suffixIcon: suffix,
        prefix: prefix,
        filled: true,
        border: border,
        enabledBorder: inputBorder,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black54,
        ),
        hintStyle: TextStyle(
          fontSize: 12,
        ),
        focusColor: Colors.black,
        hintText: hintText,
      ),
      keyboardType: inputType,
    );
  }
}

class CustomDropDownWidget extends StatelessWidget {
  String title;
  String hintText;
  dynamic selectedBHKTpe;
  Function onSaved;
  Function onChanged;
  List<dynamic> dataSource;

  CustomDropDownWidget({
    this.title,
    this.hintText,
    this.selectedBHKTpe,
    this.onSaved,
    this.dataSource,
    this.onChanged,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropDownFormField(
        //  filled: false,
        hintText: hintText,

        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        titleText: title,
        value: selectedBHKTpe,
        onSaved: onSaved,

        onChanged: onChanged,

        dataSource: dataSource
            .map(
              (type) => ({
                'display': type,
                'value': type,
              }),
            )
            .toList(),

        textField: 'display',
        valueField: 'value',
      ),
    );
  }
}
