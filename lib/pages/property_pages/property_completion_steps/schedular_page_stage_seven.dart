import 'package:demo/pages/property_pages/property_completion_steps/add_slot_schedular_page.dart';
import 'package:demo/pages/property_pages/property_completion_steps/property_details_page_one.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/upload_image_video_stage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedularPage extends StatefulWidget {
  static String id = 'upload_property_video';

  @override
  State<StatefulWidget> createState() {
    return SchedularPageState();
  }
}

class SchedularPageState extends State<SchedularPage> {
  String _platformVersion = 'Unknown';
  String _selectedOption;
  List<String> lstOptions = ['Yes', 'No'];
  String _selectedOption2;
  List<String> lstOptions2 = ['Yes', 'No'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Finish Posting',
        onTap: () {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, AddSlotPage.id),
        child: Icon(
          Icons.add,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownWidget(
                    title: 'I want to get my house painted',
                    hintText: 'Select ',
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
                  CustomDropDownWidget(
                    title: 'I want to get my house cleaned',
                    hintText: 'Select',
                    selectedBHKTpe: _selectedOption2,
                    dataSource: lstOptions2,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption2 = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _selectedOption2 = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Visibility(
                      visible: true,
                      child: Container(
                        height: 300,
                        child: Column(
                          children: [
                            ListTile(
                              horizontalTitleGap: -12,
                              title: CustomTextWidget(
                                title: 'Everyday(Monday-Sunday)',
                                fontSize: 13,
                              ),
                              leading: Icon(
                                Icons.calendar_today,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 3,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      child: ListTile(
                                        tileColor: Colors.grey[200],
                                        leading: Icon(Icons.timer),
                                        horizontalTitleGap: -5,
                                        title: CustomTextWidget(
                                          title: 'Time',
                                        ),
                                        trailing: Icon(
                                          Icons.clear,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                      replacement: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextWidget(title: 'There are no slots yet.'),
                          CustomTextWidget(
                            title: 'Press "Add Slot" to create one',
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
