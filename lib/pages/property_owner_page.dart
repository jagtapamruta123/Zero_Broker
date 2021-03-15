//import 'dart:js';

import 'dart:io';

import 'package:demo/pages/property_pages/post_new_property.dart';
import 'package:demo/pages/property_pages/property_owner_add.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PropertyOwnerPage extends StatefulWidget {
  static String id = 'property_owner';

  @override
  _PropertyOwnerPageState createState() => _PropertyOwnerPageState();
}

class CameraVideoShowDialogWidget extends StatelessWidget {
  IconData icon;
  double iconSize;
  String title;
  Function onTap;
  double top;
  CameraVideoShowDialogWidget({
    this.icon,
    this.iconSize,
    this.title,
    this.top,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Icon(
            icon,
            size: iconSize,
          ),
          Positioned(
            left: 12,
            top: top,
            child: CustomTextWidget(
              title: title,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _PropertyOwnerPageState extends State<PropertyOwnerPage> {
  // ImagePicker _picker = ImagePicker();
  // PickedFile _imageFile;
  dynamic _pickImageError;

  _showDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 15),
            child: Row(
              children: [
                CameraVideoShowDialogWidget(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                    _openBottomSheet(context: context);
                  },
                  icon: Icons.videocam,
                  top: -10,
                  title: 'Video',
                  iconSize: 70,
                ),
                SizedBox(
                  width: 50,
                ),
                CameraVideoShowDialogWidget(
                  onTap: () {
                    Navigator.pop(
                      context,
                    );
                    _openBottomSheet(context: context);
                  },
                  icon: Icons.photo,
                  top: -12,
                  title: 'Photos',
                  iconSize: 60,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _openBottomSheet({
    BuildContext context,
    String hintText,
    TextEditingController editingController,
  }) {
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
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(
                title: 'There are no Photos added yet',
                fontSize: 12,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(260, 0, 5, 5),
                child: FloatingActionButton(
                  child: Icon(
                    Icons.linked_camera_rounded,
                  ),
                  onPressed: () {
                    //upload impage by camera and gallery
                    _uploadPhotoVideoDialog(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _uploadPhotoVideoDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: Container(
            height: 40,
            margin: EdgeInsets.fromLTRB(20, 0, 0, 15),
            child: Row(
              children: [
                CameraVideoShowDialogWidget(
                  onTap: () {
                    // _openBottomSheet(context: context);
                  },
                  icon: Icons.videocam,
                  top: -10,
                  title: 'Video',
                  iconSize: 70,
                ),
                SizedBox(
                  width: 50,
                ),
                CameraVideoShowDialogWidget(
                  onTap: () {},
                  //pickImageDialog(context),
                  icon: Icons.photo,
                  top: -12,
                  title: 'Photos',
                  iconSize: 60,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // pickImageDialog(BuildContext context,
  //     {ImageSource source,
  //     double maxWidth,
  //     double maxHeight,
  //     int quality}) async {
  //   try {
  //     final pickedFile = await _picker.getImage(
  //       source: source,
  //       maxWidth: maxWidth,
  //       maxHeight: maxHeight,
  //       imageQuality: quality,
  //     );
  //     setState(() {
  //       _imageFile = pickedFile;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _pickImageError = e;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'For Property Owner',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: 175,
              child: Card(
                elevation: 10,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ClipRect(
                  child: Banner(
                    message: 'for Rent',
                    location: BannerLocation.topEnd,
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          tileMode: TileMode.clamp,
                          colors: [
                            Colors.blue[200],
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: 'ONLY DEPOSITE',
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration:
                                    BoxDecoration(color: Colors.grey[100]),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.crop_square,
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomTextWidget(
                                        title: 'Inactive',
                                        //fontWeight: FontWeight.b,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomTextWidget(
                                title: '1BHK for rent',
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CustomTextWidget(
                                title: 'No locality mentioned',
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                              Container(
                                // margin: EdgeInsets.only(left: 80),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FlatButtonWidget(
                                      minWidth: 90,
                                      buttonTitle: 'EDIT',
                                      color: Colors.pink,
                                      onPressFlatButton: () {},
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    FlatButtonWidget(
                                        minWidth: 90,
                                        buttonTitle: 'Activate',
                                        color: Colors.pink,
                                        onPressFlatButton: () {}),
                                  ],
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () => _showDialog(context),
                            child: Container(
                              color: Colors.grey[100],
                              width: 80,
                              height: 100,
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 50,
                                color: Colors.grey[300],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 190,
            child: Card(
              elevation: 10,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                        colors: [
                      Colors.blue[200],
                      Colors.white,
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextWidget(
                      title: 'List Your Place on ZeroBroker.in',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 70),
                      child: CardTextWidget(
                        line: 'faster and verified tenants/Buyers',
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 70),
                      child: CardTextWidget(
                        line: 'faster and verified tenants/Buyers',
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    FlatButtonWidget(
                        // minWidth: 30,
                        buttonTitle: 'Post New Property Ad for FREE',
                        color: Colors.pink,
                        onPressFlatButton: () {
                          Navigator.pushNamed(
                            context,
                            PostNewPropertyPage.id,
                          );
                        }),
                    Divider(),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PropertyOwnerAddPage.id,
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            CustomTextWidget(
                              title: 'Why advertise on ZeroBroker',
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
