import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBarPropertyDetails extends StatefulWidget {
  @override
  _ProgressBarPropertyDetailsState createState() =>
      _ProgressBarPropertyDetailsState();
}

class _ProgressBarPropertyDetailsState
    extends State<ProgressBarPropertyDetails> {
  // Properties _selectedProperty = Properties.OnlyRent;
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
  // StreamSubscription _locationSubscription;
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
          margin: EdgeInsets.fromLTRB(8, 10, 0, 5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 5),
            child: Column(
              children: [
                CustomDropDownWidget(
                  title: 'Apartment Type',
                  hintText: 'Select Apartment Type',
                  selectedBHKTpe: _selectedCity,
                  dataSource: cities,
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'BHK Type',
                  hintText: 'Select BHK Types',
                  selectedBHKTpe: _selectedBHKTpe,
                  dataSource: bHKType,
                  onChanged: (value) {
                    setState(() {
                      _selectedBHKTpe = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedBHKTpe = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextFormFieldWidget(
                  border: InputBorder.none,
                  labelText: 'Property Size',
                  hintText: 'build up area (sq ft)',
                ),
                SizedBox(
                  height: 30,
                ),
                CustomDropDownWidget(
                  title: 'Facing',
                  hintText: '--Select--',
                  selectedBHKTpe: _selectedFacing,
                  dataSource: facingType,
                  onChanged: (value) {
                    setState(() {
                      _selectedFacing = value;
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
                  title: 'Property Age',
                  hintText: 'Select Property Age',
                  selectedBHKTpe: _selectedPropertyAge,
                  dataSource: propertyAge,
                  onChanged: (value) {
                    setState(() {
                      _selectedPropertyAge = value;
                    });
                  },
                  onSaved: (value) {
                    setState(() {
                      _selectedPropertyAge = value;
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 150,
                        child: InkWell(
                          onTap: () => _openBottomSheet(
                              context, 'Search Floor', _controller),
                          child: CustomTextFormFieldWidget(
                            labelText: 'Floor',
                            hintText: '--SELECT--',
                            controller: _controller,
                            enable: false,
                            suffix: Icon(
                              Icons.arrow_drop_down,
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    CustomTextWidget(
                      title: 'OF',
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 150,
                      child: InkWell(
                        onTap: () => _openBottomSheet(
                            context, 'Search Total Floor', _controllerOfFloor),
                        child: CustomTextFormFieldWidget(
                          labelText: 'Floor',
                          hintText: '--SELECT--',
                          controller: _controllerOfFloor,
                          enable: false,
                          suffix: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
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
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //  cursorHeight: 3,
      onTap: onTAP,
      maxLines: lines,
      controller: controller,
      cursorColor: Colors.black,
      enabled: enable,
      enableInteractiveSelection: false,
      textDirection: TextDirection.ltr,
      autofocus: false,
      decoration: InputDecoration(
        suffixIcon: suffix,
        prefixIcon: prefix,
        // prefix: prefix,
        filled: true,
        border: border,
        enabledBorder: InputBorder.none,
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
