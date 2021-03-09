//import 'dart:js';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class PropertyOwnerAddPage extends StatefulWidget {
  static String id = 'adv_property_owner';

  @override
  _PropertyOwnerAddPageState createState() => _PropertyOwnerAddPageState();
}

class _PropertyOwnerAddPageState extends State<PropertyOwnerAddPage> {
  int _currentIndex = 0;

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
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Post FREE Property Ad ',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 240,
              color: Colors.pink[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CustomTextWidget(
                        title: 'For Property Owners',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Rent/Sell your property for',
                        fontSize: 15,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 50,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 2),
                          child: CustomTextWidget(
                            title: 'Free',
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 90,
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: CarouselSlider.builder(
                      itemCount: 6,
                      itemBuilder:
                          (BuildContext context, int itemIndex, int options) =>
                              Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextWidget(
                              title: 'Zero Brokerage',
                            ),
                          ],
                        ),
                      ),
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          aspectRatio: 1.0,
                          initialPage: 0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomTextWidget(
                title: 'Rent / Sell in 3 simple steps ',
                fontSize: 20,
              ),
            ),
            Container(
              height: 190,
              child: ListView.builder(
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: Icon(
                        Icons.watch_later_outlined,
                      ),
                      title: Row(
                        children: [
                          CustomTextWidget(
                            title: 'Advertise your',
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            title: ' Property ',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomTextWidget(
                            title: 'on ZeroBroker',
                            fontSize: 12,
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                      leading: CustomTextWidget(
                        title: '${index + 1}',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 65,
              width: 320,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.blue[50],
                  border: Border.all(
                    color: Colors.blue,
                  )),
              //color: Colors.orange[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 5, 0),
                    child: Icon(
                      Icons.no_meeting_room_rounded,
                      color: Colors.blue[200],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 200,
                    child: Text(
                      'Zero Broker does not charge you any kind of brokerage ',
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CustomTextWidget(
                title: '30 Lac+ Home Owner Trust Us ',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 280,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.pink[100], Colors.white],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(35, 30, 50, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'Natarajan | Pune',
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // Icon(Icons.arrow_forward)
                          RichText(
                            text: TextSpan(
                              text: '"  I am really excite about using ',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'ZEROBroker Pay.',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' I had paid my house rent through my credit card.The The entire process is so seamless.My landlord too got an instant notification.' +
                                        'ZEROBROKER people claim they will credit the amount within 48 hrs, mine got credited under 7 hrs."'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                viewportFraction: 0.8,
                itemCount: 3,
                autoplay: false,
                itemWidth: 300,
                itemHeight: 250,
                layout: SwiperLayout.DEFAULT,
                pagination: new SwiperPagination(),
                control: new SwiperControl(
                    // iconNext: IconData(0xe5af,
                    //     fontFamily: 'MaterialIcons',
                    //     matchTextDirection: true),
                    ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
