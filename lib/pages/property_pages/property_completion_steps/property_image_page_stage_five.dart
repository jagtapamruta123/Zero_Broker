import 'dart:async';
import 'dart:io';

import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/upload_image_video_stage_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

class PropertyImagePage extends StatefulWidget {
  static String id = 'upload_property_image';

  @override
  State<StatefulWidget> createState() {
    return PropertyImagePageState();
  }
}

class PropertyImagePageState extends State<PropertyImagePage> {
  String _platformVersion = 'Unknown';
  ImagePicker _picker = ImagePicker();
  PickedFile _imageFile;
  dynamic _pickImageError;
  File fileImage;
  bool isVideo = false;
  bool isImageSelected = false;

  // if (_controller != null) {
  //   await _controller!.setVolume(0.0);
  // }
  // if (isVideo) {
  //   final PickedFile file = await _picker.getVideo(
  //       source: source, maxDuration: const Duration(seconds: 10));
  //   //  await _playVideo(file);
  // } else {
  void displayPickImageDialog(
      {context,
      double maxWidth,
      double maxHeight,
      int quality,
      ImageSource source}) async {
    try {
      final pickedFile = await _picker.getImage(
        source: source,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
        imageQuality: quality,
      );
      setState(() {
        _imageFile = pickedFile;
        fileImage = File(_imageFile.path);
        isImageSelected = true;
        print(_imageFile.path);
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterOpenWhatsapp.platformVersion;
      print(platformVersion);
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // void launchWhatsApp({
  //   @required int phone,
  //   @required String message,
  // }) async {
  //   String url() {
  //     if (Platform.isAndroid) {
  //       return "https://wa.me/$phone/?text=${Uri.parse(message)}";
  //     } else {
  //       return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}";
  //     }
  //   }

  //   if (await canLaunch(url())) {
  //     await launch(url());
  //   } else {
  //     throw 'Could not launch ${url()}';
  //   }
  // }

  @override
  void initState() {
    initPlatformState();
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
          height: 310,
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
                onTap: () {
                  displayPickImageDialog(
                    context: context,
                    source: ImageSource.gallery,
                  );
                },
                icon: Icon(
                  Icons.photo_library_outlined,
                ),
                name: 'Upload From Gallery',
              ),
              // Visibility(
              //   visible: isImageSelected,
              //   child: fileImage != null
              //       ? Image.file(fileImage)
              //       : Text('image not available'),
              //   replacement: Icon(
              //     Icons.photo_library_outlined,
              //   ),
              // ),
              // name: 'Upload From Gallery',
              //  ),
              SizedBox(
                height: 20,
              ),
              UploadItemWidget(
                onTap: () {
                  displayPickImageDialog(
                    context: context,
                    source: ImageSource.camera,
                  );
                },
                icon: Icon(
                  Icons.camera_alt_outlined,
                ),
                name: 'Take Picture',
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextWidget(
                fontSize: 18,
                title: 'or',
              ),
              SizedBox(
                height: 5,
              ),
              MaterialButton(
                onPressed: () {
                  //  launchWhatsApp(phone: 9665322404, message: 'Hello');
                  FlutterOpenWhatsapp.sendSingleMessage("9665322404", "Hello");
                },
                child: CustomTextWidget(
                  fontSize: 14,
                  title: 'Whats App the image on +91-9665322404',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
