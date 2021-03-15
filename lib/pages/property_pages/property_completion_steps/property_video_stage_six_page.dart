import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/upload_image_video_stage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PropertyVideoPage extends StatefulWidget {
  static String id = 'upload_property_video';

  @override
  State<StatefulWidget> createState() {
    return PropertyVideoPageState();
  }
}

class PropertyVideoPageState extends State<PropertyVideoPage> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Save and Continue',
        onTap: () {},
      ),
      body: Card(
        elevation: 5,
        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Container(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                fontSize: 18,
                title: 'Upload Property Images',
              ),
              SizedBox(
                height: 30,
              ),
              UploadItemWidget(
                icon: Icon(
                  Icons.photo_library_outlined,
                ),
                name: 'Upload From Gallery',
              ),
              SizedBox(
                height: 20,
              ),
              UploadItemWidget(
                icon: Icon(
                  Icons.camera_alt_outlined,
                ),
                name: 'Take Picture',
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
