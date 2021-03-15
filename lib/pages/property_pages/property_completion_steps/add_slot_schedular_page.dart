import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/upload_image_video_stage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class AddSlotPage extends StatefulWidget {
  static String id = 'add_slot';

  @override
  State<StatefulWidget> createState() {
    return AddSlotPageState();
  }
}

class AddSlotPageState extends State<AddSlotPage> {
  String _platformVersion = 'Unknown';
  String _selectedOption;
  bool isAvaiable = false;
  List<String> lstOptions = [
    'EveryDay(monday-Sunday)',
    'Weekdays(Monday-Friday)',
    'Weekends(Saturday & Sunday)'
  ];

  TextEditingController _fromTime = TextEditingController();
  TextEditingController _toTime = TextEditingController();
  String _setTime, _setDate;
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  String _hour, _minute, _time;

  Future<Null> _selectTime(
    BuildContext context,
    TextEditingController timerText,
  ) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        timerText.text = _time;
        timerText.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    //  _fromTime.text = formatDate(
    //     DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
    //     [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          title: 'Add Slot',
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.clear,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Mark Availability',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c='),
                  fit: BoxFit.fill,
                ),
              ),
              //  color: Colors.pink[50],
              child: Container(
                margin: EdgeInsets.fromLTRB(30, 20, 20, 0),
                child: CustomTextWidget(
                  title:
                      'Owner -Tenant meeting can be scheduled on the given slot.',
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'you would like to schedule meetings for',
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomDropDownWidget(
                    hintText: ' Select ',
                    selectedBHKTpe: _selectedOption,
                    dataSource: lstOptions,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomTextWidget(
                    title: 'you would like to schedule meetings for',
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextFormFieldWidget(
                    border: InputBorder.none,
                    controller: _fromTime,
                    prefix: Icon(
                      Icons.timer,
                    ),
                    hintText: 'From',
                    onTAP: () {
                      _selectTime(context, _fromTime);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFieldWidget(
                    border: InputBorder.none,
                    controller: _toTime,
                    prefix: Icon(
                      Icons.timer,
                    ),
                    hintText: 'To',
                    onTAP: () {
                      _selectTime(context, _toTime);
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isAvaiable,
                        //   tristate: false,
                        onChanged: (bool value) {
                          setState(() {
                            isAvaiable = value;
                            print(isAvaiable);
                          });
                        },
                      ),
                      CustomTextWidget(
                        title: 'Available all day',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
