//import 'dart:js';

import 'package:demo/pages/home_service_bottom_navigation/select_apartment_type.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExpertPaintingConsultationPage extends StatefulWidget {
  static String id = 'expert_painting_consultation';

  @override
  _ExpertPaintingConsultationPageState createState() =>
      _ExpertPaintingConsultationPageState();
}

class _ExpertPaintingConsultationPageState
    extends State<ExpertPaintingConsultationPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.yellow[800],
              child: CircleAvatar(
                radius: 10.5,
                backgroundColor: Colors.yellow[200],
                child: CircleAvatar(
                  radius: 9,
                  child: Text(
                    'N',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.yellow[800],
                ),
              ),
            ),
          ),
        ],
        title: Text(
          'Expert Painting Consultation',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Book Free Consultation,',
        onTap: () {
          Navigator.pushNamed(context, SelectApartmentType.id);
        },
        //  onTap: (),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                  'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c='),
              SizedBox(
                height: 25,
              ),
              CustomTextWidget(
                title: 'Why book a doorstep consultation?',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: 4,
              ),
              CustomTextWidget(
                title: 'To provide you with  best value quotation,our ' +
                    'Painting Expert will visit your house to take ' +
                    'painting area measurements and guide you to ' +
                    'make best choice',
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Container(
                height: 400,
                child: ListViewCustomWidget(
                  length: 5,
                  subTitle:
                      'We take exact measurements of area to be painted using lesar technique',
                  title: 'Accurate Measurements',
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    child: Icon(
                      Icons.brush_outlined,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
