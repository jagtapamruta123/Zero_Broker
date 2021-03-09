//import 'dart:js';

import 'package:demo/pages/home_service_bottom_navigation/home_service_card_item_pages/select_home_service_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../z_b_cash_page.dart';

class PaintingItemPage extends StatefulWidget {
  static String id = 'painting_consultation';

  @override
  _PaintingItemPageState createState() => _PaintingItemPageState();
}

class _PaintingItemPageState extends State<PaintingItemPage> {
  String _selectCity;
  String mobileNumber = '9637082374';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ZeroBrokerCashIcon(
              onTapIcon: () => Navigator.pushNamed(
                context,
                ZBCashPage.id,
              ),
            ),
          )
        ],
        title: Text(
          'Expert Painting Consultation',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationButtonWidget(
        title: 'Book Free Consultation,',
        onTap: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 720,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c='),
                  fit: BoxFit.fill,
                ),
              ),
              //  color: Colors.pink[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                            " Select City ",
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
                      Spacer(),
                      Expanded(
                        child: PressToCallRentalAgreementPage(
                          mobileNumber: mobileNumber,
                          onTap: () => {_service.call(mobileNumber)},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            title: 'Best Home Painters in PUNE',
                            fontSize: 25,
                          ),
                          CustomTextWidget(
                            title: 'Get Lowest Price for home painting in pune',
                            fontSize: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Colors.white.withOpacity(0.1),
                    //Card with stadium border
                    shape: StadiumBorder(
                      //Card with stadium border
                      side: BorderSide(
                        color: Colors.transparent,
                        width: 2.0,
                      ),
                    ),

                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListTile(
                      leading: Container(
                        width: 30,
                        height: 15,
                        margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 2, 4, 2),
                            child: CustomTextWidget(
                              title: 'Offer',
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                      title: CustomTextWidget(
                        title: 'Upto 25% off on Painting Service',
                      ),
                      trailing: CircleAvatar(
                        child: Icon(
                          Icons.home_outlined,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: CustomTextWidget(
                        title: 'Select waht you want',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    child: GridView.builder(
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 0,
                      ),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            //   navigator(index: index,context: context,)
                            Navigator.pushNamed(
                              context,
                              FullHouseCleaningPage.id,
                            );
                          },
                          child: Card(
                            elevation: 5,
                            color: Colors.pink[50].withOpacity(0.3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c='),
                                  //   fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Rental Painting',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'Home Painting Include Includes',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      // controller: ,
                      itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 8),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 10,
                        child: Container(
                          width: 300,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.pink[50],
                              child: Text(
                                '${index + 1}',
                              ),
                            ),
                            title: CustomTextWidget(
                              title:
                                  'Free House Inspection with Expert Consultation',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // height: 50,
                          //margin: EdgeInsets.only(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // width: double.infinity,
              height: 300,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'How It Works',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListViewCustomWidget(
                      length: 3,
                      subTitle:
                          'Best in class legal documents at attractive price',
                      title: 'Lowest Price',
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[50],
                        child: Icon(
                          Icons.wifi_protected_setup_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // width: double.infinity,
              height: 300,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'Zero Broker Promise',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListViewCustomWidget(
                      length: 3,
                      subTitle:
                          'Best in class legal documents at attractive price',
                      title: 'Lowest Price',
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[50],
                        child: Icon(
                          Icons.wifi_protected_setup_outlined,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 20,
              //color: Colors.grey[200],
              // thickness: 20,
            ),
            Container(
              height: 360,
              // width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CustomTextWidget(
                      title: 'Customer Stories',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: Container(
                      //height: 360,
                      child: SwipperCustomWidget(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 40,
              color: Colors.grey[200],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Center(
                child: CustomTextWidget(
                  title: 'Top Questions',
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              height: 350,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  //: true,
                  // scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int count) {
                    return QuestionAnsExpandedWidget(
                        que: 'How secure zERO broker PAY?',
                        ans: 'Security is incredibly important to us, therefore' +
                            'when you pay on our website ,we use sofisticated security' +
                            'measure to ensure your confidential information is secure' +
                            'and encrypted.Zero broker pay');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// Future navigator({int index, BuildContext context, String routeName}) {
//   switch (index) {
//     case 0: // Enter this block if mark == 0
//       return Navigator.pushNamed(
//         context,
//         HomeserviceItemPage.id,
//       );
//     // break;
//     case 1:
//       return Navigator.pushNamed(
//         context,
//         HomeserviceItemPage.id,
//       );
//     //  break;
//     case 2:
//     // case 3: // Enter this block if mark == 1 or mark == 2 or mark == 3
//     //   return "mark is either 1, 2 or 3";
//     // // etc.
//     // default:
//     //   return "mark is not 0, 1, 2 or 3";
//   }
// }

class SwipperCustomWidget extends StatelessWidget {
  final String name;
  final String richText1;
  final String richText2;
  final String richText3;
  final int itemCountSwipper;
  final int itemCountRatings;
  // final SwipperLayout layout;
  const SwipperCustomWidget({
    this.name,
    this.richText1,
    this.richText2,
    this.richText3,
    this.itemCountSwipper,
    this.itemCountRatings,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Swiper(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(),
                    SizedBox(
                      width: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Amruta Jagtap',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 3.5,
                            minRating: 1,
                            itemSize: 10,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              //size: 2,
                              color: Colors.pink,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                // Icon(Icons.arrow_forward)
                RichText(
                  text: TextSpan(
                    text: '"  I am really excite about using ',
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'ZEROBroker Pay.',
                          style: TextStyle(fontWeight: FontWeight.bold)),
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
      itemHeight: 350,
      layout: SwiperLayout.DEFAULT,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
    );
  }
}
