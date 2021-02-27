import 'package:demo/services/range_slider_data.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter_range_slider/flutter_range_slider.dart' as frs;

class SearchLocalities extends StatefulWidget {
  static String id = 'search_localities_page';
  @override
  _SearchLocalitiesState createState() => _SearchLocalitiesState();
}

class _SearchLocalitiesState extends State<SearchLocalities> {
  List<RangeSliderData> rangeSliders;

  String _selectCity;
  //String _selectedCity;
  bool _isOneBHkSelected = false;
  bool _isOneRkSelected = false;
  bool _isTwoBHKSelected = false;
  bool _isThreeBHKSelected = false;
  bool _isFourBHKSelected = false;
  bool propertyCheckBox = false;
  bool selectedProperty = false;
  bool isPropertyReady = false;
  bool isWantFullHouse = true;
  bool isWantPG = false;
  bool isWantFlatmate = false;
  double _lowerValue = 20.0;
  double _upperValue = 80.0;
  double _lowerValueFormatter = 20.0;
  double _upperValueFormatter = 20.0;
  bool isLookingToReady = true;
  bool isUnderConstructuion = false;

  List<dynamic> citiesLst = [];
  List<String> _choices = ['data', 'data2'];
  int _choiceIndex;

  Widget choiceChipWidget(
      {String label, bool isSelected, Function onSelected}) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      //_value == index,
      onSelected: onSelected,

      // (bool selected) {
      //   setState(() {
      //     selectedProperty = selected;
      //     // _value = selected ? index : null;
      //   });
      // },
    );
  }

  Widget inputChips({String title, Function isSelected, bool isSelectedChip}) {
    return InputChip(
      padding: EdgeInsets.all(2.0),
      label: Text(
        title,
        overflow: TextOverflow.ellipsis,
        // maxLines: 2,
      ),
      selected: isSelectedChip,
      selectedColor: Colors.green,
      onSelected: isSelected,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications,
              ),
              onPressed: null,
            )
          ],
          centerTitle: true,
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.mode_sharp,
                  color: Colors.white,
                  size: 20,
                ),
                radius: 14,
                backgroundColor: Colors.pink[400],
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                'ZERO',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'BROKER',
                style: TextStyle(
                  color: Colors.black54,
                ),
              )
            ],
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Rent',
              ),
              Tab(
                text: 'Buy',
              ),
              Tab(
                text: 'Commertial',
              )
            ],
          ),
        ),
        bottomNavigationBar: NavigationButtonWidget(
          title: 'Search',
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 625,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black38,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                            child: DropdownButton<String>(
                              value: _selectCity,
                              //elevation: 5,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),

                              items: <String>[
                                'Pune',
                                'Noida',
                                'Faridabad',
                                'Nagpur',
                                'Solapur',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Please Select City ",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _selectCity = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      TabSearchBarWidget(
                        iconSuffix: Icon(
                          Icons.location_on,
                        ),

                        // IconButton(
                        //   onPressed: null,
                        //   icon: Icon(
                        //     Icons.location_on,
                        //   ),
                        // ),
                        iconSearch: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        function: null,
                        hintText: "Search upto 3 locations or LandMarks",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                            child: Checkbox(
                              value: false,
                              onChanged: null,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                            child: CustomTextWidget(
                              title: 'include nearby properties',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: CustomTextWidget(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          title: 'Number of BedRooms',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            inputChips(
                              title: '1 RK',
                              isSelectedChip: _isOneRkSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isOneRkSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: '1 BHK',
                              isSelectedChip: _isOneBHkSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isOneBHkSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: '2 BHK',
                              isSelectedChip: _isTwoBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isTwoBHKSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: '3 BHK',
                              isSelectedChip: _isThreeBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isThreeBHKSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: '4 BHK',
                              isSelectedChip: _isFourBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isFourBHKSelected = selected;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: CustomTextWidget(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          title: 'Price Range:0 to 10,00,00,000',
                        ),
                      ),
                      frs.RangeSlider(
                        min: 0,
                        max: 100,
                        lowerValue: _lowerValueFormatter,
                        upperValue: _upperValueFormatter,
                        divisions: 10,
                        showValueIndicator: true,
                        valueIndicatorFormatter: (int index, double value) {
                          String twoDecimals = value.toStringAsFixed(2);
                          return '$twoDecimals ';
                        },
                        onChanged:
                            (double newLowerValue, double newUpperValue) {
                          setState(() {
                            _lowerValueFormatter = newLowerValue;
                            _upperValueFormatter = newUpperValue;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: CustomTextWidget(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          title: 'Property Status',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            choiceChipWidget(
                              label: 'Ready',
                              isSelected: isPropertyReady,
                              onSelected: (bool selected) {
                                setState(() {
                                  isPropertyReady = selected;
                                  selectedProperty = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                            choiceChipWidget(
                              label: 'Under Construction',
                              isSelected: selectedProperty,
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedProperty = selected;
                                  isPropertyReady = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                            child: Checkbox(
                              value: false,
                              onChanged: null,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                            child: CustomTextWidget(
                              title: 'Exclusive Deals',
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),

//2nd tab View=======================================================================
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black38,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                            child: DropdownButton<String>(
                              value: _selectCity,
                              //elevation: 5,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),

                              items: <String>[
                                'Pune',
                                'Noida',
                                'Faridabad',
                                'Nagpur',
                                'Solapur',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Please Select City ",
                                style: TextStyle(
                                  color: Colors.black38,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _selectCity = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      TabSearchBarWidget(
                        iconSuffix: Icon(
                          Icons.location_on,
                        ),
                        // IconButton(
                        //   onPressed: null,
                        //   icon: Icon(
                        //     Icons.location_on,
                        //   ),
                        // ),
                        iconSearch: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        function: null,
                        hintText: "Search upto 3 locations or LandMarks",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                        child: CustomTextWidget(
                          title: 'Looking for',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            choiceChipWidget(
                              label: 'Full House',
                              isSelected: isWantFullHouse,
                              onSelected: (bool selected) {
                                setState(() {
                                  isWantFullHouse = selected;
                                  isWantPG = false;
                                  isWantFlatmate = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                            choiceChipWidget(
                              label: 'PG/Hostel',
                              isSelected: isWantPG,
                              onSelected: (bool selected) {
                                setState(() {
                                  isWantPG = selected;
                                  isWantFlatmate = false;
                                  isWantFullHouse = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                            choiceChipWidget(
                              label: 'Flatmates',
                              isSelected: isWantFlatmate,
                              onSelected: (bool selected) {
                                setState(() {
                                  isWantFlatmate = selected;
                                  isWantPG = false;
                                  isWantFullHouse = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isWantFullHouse,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                  child: Checkbox(
                                    value: false,
                                    onChanged: null,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                                  child: CustomTextWidget(
                                    title: 'Include Near By Properties',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Number OF BedRooms',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Wrap(
                                spacing: 5,
                                children: [
                                  inputChips(
                                    title: '1 RK',
                                    isSelectedChip: _isOneRkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneRkSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: '1 BHK',
                                    isSelectedChip: _isOneBHkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneBHkSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: '2 BHK',
                                    isSelectedChip: _isTwoBHKSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isTwoBHKSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: '3 BHK',
                                    isSelectedChip: _isThreeBHKSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isThreeBHKSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: '4 BHK',
                                    isSelectedChip: _isFourBHKSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isFourBHKSelected = selected;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: CustomTextWidget(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                title: 'Price Range:0 to 500000',
                              ),
                            ),
                            frs.RangeSlider(
                              min: 0.0,
                              max: 100.0,
                              lowerValue: _lowerValueFormatter,
                              upperValue: _upperValueFormatter,
                              divisions: 10,
                              showValueIndicator: true,
                              valueIndicatorFormatter:
                                  (int index, double value) {
                                String twoDecimals = value.toStringAsFixed(2);
                                return '$twoDecimals ';
                              },
                              onChanged:
                                  (double newLowerValue, double newUpperValue) {
                                setState(() {
                                  _lowerValueFormatter = newLowerValue;
                                  _upperValueFormatter = newUpperValue;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Availabilities:',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                              child: Wrap(
                                spacing: 5,
                                children: [
                                  choiceChipWidget(
                                    label: 'Withing 15 Days',
                                    isSelected: isPropertyReady,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        isPropertyReady = selected;
                                        selectedProperty = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                  choiceChipWidget(
                                    label: 'Immediate',
                                    isSelected: selectedProperty,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedProperty = selected;
                                        isPropertyReady = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isWantPG,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Gender',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Wrap(
                                spacing: 30,
                                children: [
                                  choiceChipWidget(
                                    label: 'Male',
                                    isSelected: isPropertyReady,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        isPropertyReady = selected;
                                        selectedProperty = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                  choiceChipWidget(
                                    label: 'Female',
                                    isSelected: selectedProperty,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedProperty = selected;
                                        isPropertyReady = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Room Type',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Wrap(
                                spacing: 10,
                                children: [
                                  inputChips(
                                    title: 'Single Room',
                                    isSelectedChip: _isOneRkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneRkSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: 'Double Sharing',
                                    isSelectedChip: _isOneBHkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneBHkSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: 'Triple Sharing',
                                    isSelectedChip: _isTwoBHKSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isTwoBHKSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: 'Four Sharing',
                                    isSelectedChip: _isThreeBHKSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isThreeBHKSelected = selected;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: CustomTextWidget(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                title: 'Price Range:0 to 500000',
                              ),
                            ),
                            frs.RangeSlider(
                              min: 0.0,
                              max: 100.0,
                              lowerValue: _lowerValueFormatter,
                              upperValue: _upperValueFormatter,
                              divisions: 10,
                              showValueIndicator: true,
                              valueIndicatorFormatter:
                                  (int index, double value) {
                                String twoDecimals = value.toStringAsFixed(2);
                                return '$twoDecimals ';
                              },
                              onChanged:
                                  (double newLowerValue, double newUpperValue) {
                                setState(() {
                                  _lowerValueFormatter = newLowerValue;
                                  _upperValueFormatter = newUpperValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isWantFlatmate,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                                  child: Checkbox(
                                    value: false,
                                    onChanged: null,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                                  child: CustomTextWidget(
                                    title: 'Include Near By Properties',
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Room Type',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: Wrap(
                                spacing: 10,
                                children: [
                                  inputChips(
                                    title: 'Single Room',
                                    isSelectedChip: _isOneRkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneRkSelected = selected;
                                      });
                                    },
                                  ),
                                  inputChips(
                                    title: 'Sharing Room',
                                    isSelectedChip: _isOneBHkSelected,
                                    isSelected: (bool selected) {
                                      setState(() {
                                        _isOneBHkSelected = selected;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 0, 10, 0),
                              child: CustomTextWidget(
                                title: 'Tenant Type',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                              child: Wrap(
                                spacing: 30,
                                children: [
                                  choiceChipWidget(
                                    label: 'Male',
                                    isSelected: isPropertyReady,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        isPropertyReady = selected;
                                        selectedProperty = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                  choiceChipWidget(
                                    label: 'Female',
                                    isSelected: selectedProperty,
                                    onSelected: (bool selected) {
                                      setState(() {
                                        selectedProperty = selected;
                                        isPropertyReady = false;
                                        // _value = selected ? index : null;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                thickness: 1.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: CustomTextWidget(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                title: 'Price Range:0 to 500000',
                              ),
                            ),
                            frs.RangeSlider(
                              min: 0.0,
                              max: 100.0,
                              lowerValue: _lowerValueFormatter,
                              upperValue: _upperValueFormatter,
                              divisions: 10,
                              showValueIndicator: true,
                              valueIndicatorFormatter:
                                  (int index, double value) {
                                String twoDecimals = value.toStringAsFixed(2);
                                return '$twoDecimals ';
                              },
                              onChanged:
                                  (double newLowerValue, double newUpperValue) {
                                setState(() {
                                  _lowerValueFormatter = newLowerValue;
                                  _upperValueFormatter = newUpperValue;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //3nd tab view======================================================
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.black38,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
                            child: DropdownButton<String>(
                              value: _selectCity,
                              //elevation: 5,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),

                              items: <String>[
                                'Pune',
                                'Noida',
                                'Faridabad',
                                'Nagpur',
                                'Solapur',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              hint: Text(
                                "Please Select City ",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  _selectCity = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      TabSearchBarWidget(
                        iconSuffix: Icon(
                          Icons.location_on,
                        ),

                        // IconButton(
                        //   onPressed: null,
                        //   icon: Icon(
                        //     Icons.location_on,
                        //   ),
                        // ),
                        iconSearch: Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        function: null,
                        hintText: "Search upto 3 locations or LandMarks",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: CustomTextWidget(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          title: 'Looking to',
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Wrap(
                          spacing: 10,
                          children: [
                            choiceChipWidget(
                              label: 'Ready',
                              isSelected: isPropertyReady,
                              onSelected: (bool selected) {
                                setState(() {
                                  isPropertyReady = selected;
                                  selectedProperty = false;
                                  isLookingToReady = true;
                                  isUnderConstructuion = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                            choiceChipWidget(
                              label: 'Under Construction',
                              isSelected: selectedProperty,
                              onSelected: (bool selected) {
                                setState(() {
                                  selectedProperty = selected;
                                  isPropertyReady = false;
                                  isUnderConstructuion = true;
                                  isLookingToReady = false;
                                  // _value = selected ? index : null;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: CustomTextWidget(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          title: 'Property Type',
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                        child: Wrap(
                          spacing: 5,
                          children: [
                            inputChips(
                              title: 'Office Space',
                              isSelectedChip: _isOneRkSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isOneRkSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: 'Co-Working',
                              isSelectedChip: _isOneBHkSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isOneBHkSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: 'Godown/warehouse',
                              isSelectedChip: _isTwoBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isTwoBHKSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: 'Restaurant/cafe',
                              isSelectedChip: _isThreeBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isThreeBHKSelected = selected;
                                });
                              },
                            ),
                            inputChips(
                              title: 'Showroom',
                              isSelectedChip: _isFourBHKSelected,
                              isSelected: (bool selected) {
                                setState(() {
                                  _isFourBHKSelected = selected;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 1.0,
                        ),
                      ),
                      Visibility(
                        visible: isLookingToReady,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: CustomTextWidget(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                title: 'Price Range:0 to 500000',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                              child: frs.RangeSlider(
                                min: 0.0,
                                max: 100.0,
                                lowerValue: _lowerValueFormatter,
                                upperValue: _upperValueFormatter,
                                divisions: 10,
                                showValueIndicator: true,
                                valueIndicatorFormatter:
                                    (int index, double value) {
                                  String twoDecimals = value.toStringAsFixed(2);
                                  return '$twoDecimals ';
                                },
                                onChanged: (double newLowerValue,
                                    double newUpperValue) {
                                  setState(() {
                                    _lowerValueFormatter = newLowerValue;
                                    _upperValueFormatter = newUpperValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isUnderConstructuion,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                              child: CustomTextWidget(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                title: 'Price Range:0 to 1000000000',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                              child: frs.RangeSlider(
                                min: 0.0,
                                max: 100.0,
                                lowerValue: _lowerValueFormatter,
                                upperValue: _upperValueFormatter,
                                divisions: 10,
                                showValueIndicator: true,
                                valueIndicatorFormatter:
                                    (int index, double value) {
                                  String twoDecimals = value.toStringAsFixed(2);
                                  return '$twoDecimals ';
                                },
                                onChanged: (double newLowerValue,
                                    double newUpperValue) {
                                  setState(() {
                                    _lowerValueFormatter = newLowerValue;
                                    _upperValueFormatter = newUpperValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class DropdownWidget extends StatelessWidget {
  List<dynamic> cities = [];
  String title;
  String hintText;
  Function onSaved;
  String valueField;
  String textField;
  Function onChanged;
  dynamic value;
  DropdownWidget({
    this.cities,
    this.title,
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.textField,
    this.valueField,
    this.value,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Theme(
        data: Theme.of(context).copyWith(brightness: Brightness.dark),
        child: DropDownFormField(
            titleText: title,
            hintText: hintText,
            value: value,
            onSaved: onSaved,
            //  (value) {
            // setState(() {
            //   _selectCity = value;
            // });
            // },
            onChanged: onChanged
            // (value) {
            // setState(() {
            //   _selectCity = value;
            // });
            // },
            ,
            dataSource: cities,
            textField: textField,
            //cities.asMap().values.toString(),
            valueField: valueField
            //cities.asMap().keys.toString(),
            ),
      ),
    );
  }
}

// DropdownWidget(
//   title: 'Cities',
//   hintText: 'Select cities',
//   value: _selectedCity,
//   onChanged: (value) {
//     setState(() {
//       print(value);
//       _selectedCity = value;
//     });
//   },
//   onSaved: (value) {
//     setState(() {
//       print(value);
//       _selectedCity = value;
//     });
//   },
//   textField: citiesLst.asMap().values.toString(),
//   valueField: citiesLst.asMap().keys.toString(),
//   cities: citiesLst,
// )
