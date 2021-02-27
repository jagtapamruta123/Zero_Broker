import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../rental_agreement_page.dart';

class NavHomePage extends StatefulWidget {
  static String id = 'nav_home';
  @override
  _NavHomePageState createState() => _NavHomePageState();
}

class _NavHomePageState extends State<NavHomePage> {
  String _selectCity;
  String mobileNumber = '9637082374';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: 150,
          width: double.infinity,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                top: -20,
                right: MediaQuery.of(context).size.width / 2.3,
                child: FloatingActionButton(
                  onPressed: null,
                  elevation: 10,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 100,
                child: Column(
                  children: [
                    Text(
                      'Personal Assistance',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            child: Icon(
                              Icons.check,
                              size: 18,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Assist you in preparing the agreement and drafting the custom' +
                                  'Clauses to suit your requirements.',
                              maxLines: 2,
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
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
      body: SingleChildScrollView(
        child: Container(
          height: 2120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 250,
                color: Colors.pink[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Center(
                        child: CustomTextWidget(
                          title: 'Online Rental Agreement',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: CustomTextWidget(
                        title: 'Best online agreement service in benglore',
                        fontSize: 10,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        // controller: ,
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            Container(
                          height: 200,
                          width: 330,
                          child: Card(
                            margin: EdgeInsets.fromLTRB(20, 20, 30, 20),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                  title: Text(
                                    'Doorstep Delivery',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Zero contact document delivery.No need to step out of home',
                                    maxLines: 5,
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  leading: CircleAvatar(
                                    child: Icon(
                                      Icons.watch,
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
                      child: CustomTextWidget(
                        title: 'Select Package',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      title: 'Finish Your Agreement',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Spacer(),
                                    Center(
                                        child:
                                            Icon(Icons.navigate_next_outlined))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  child: CustomTextWidget(
                                    title: 'You\'re 0% of way there to finish',
                                    fontSize: 8,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                LinearPercentIndicator(
                                  width: 285,
                                  lineHeight: 5.0,
                                  percent: 0.5,
                                  // linearStrokeCap: LinearStrokeCap.butt,
                                  backgroundColor: Colors.pink[50],
                                  progressColor: Colors.pink,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 2, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomTextWidget(
                                      title: 'E-Stamped Agreement',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Spacer(),
                                    FlatButton(
                                      //splashColor: Colors.red,
                                      color: Colors.pink,
                                      height: 35,
                                      child: Text(
                                        'Select',
                                      ),
                                      onPressed: () {
                                        _settingModalBottomSheet(context);
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
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
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.pink[50],
                                          border: Border.all(
                                            color: Colors.pink,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: CustomTextWidget(
                                          title: 'extra 500 ZBCash Discount',
                                          fontSize: 8,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                CardTextWidget(
                                  line: 'start from 379 plus govt stamp duty',
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                CardTextWidget(
                                  line: 'agreement printed on E-stamp',
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                CardTextWidget(
                                  line: 'Couriered and delivered to you',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: FlatButtonWidget(
                        buttonTitle: 'Create Rental Agreement',
                        onPressFlatButton: () {},
                        color: Colors.pink,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 40,
                color: Colors.grey[200],
                thickness: 40,
              ),
              Container(
                // width: double.infinity,
                height: 300,
                margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                            ),
                            color: Colors.blue[50],
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CircleAvatar(
                                  radius: 10,
                                  child: Icon(
                                    Icons.check,
                                    size: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: CustomTextWidget(
                                  title: 'ZB Assured',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomTextWidget(
                      title: 'How it Works',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        //shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int count) {
                          return ListTile(
                            title: CustomTextWidget(
                              title: 'Lowest Price',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            subtitle: Column(
                              children: [
                                CustomTextWidget(
                                  title:
                                      'Best in class legal documents at attractive price',
                                  fontSize: 12,
                                ),
                                Divider()
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue[50],
                              child: Icon(
                                Icons.wifi_protected_setup_outlined,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40,
                color: Colors.grey[200],
                thickness: 20,
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
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 3,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int count) {
                          return ListTile(
                            title: CustomTextWidget(
                              title: 'Lowest Price',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            subtitle: Column(
                              children: [
                                CustomTextWidget(
                                  title:
                                      'Best in class legal documents at attractive price',
                                  fontSize: 12,
                                ),
                                Divider()
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.blue[50],
                              child: Icon(
                                Icons.wifi_protected_setup_outlined,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 10,
                color: Colors.grey[200],
                thickness: 20,
              ),
              Divider(
                height: 10,
                color: Colors.white,
                thickness: 20,
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        //height: 360,
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
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Amruta Jagtap',
                                                style: TextStyle(fontSize: 12),
                                              ),
                                              RatingBar.builder(
                                                initialRating: 3.5,
                                                minRating: 1,
                                                itemSize: 10,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                        text:
                                            '"  I am really excite about using ',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: 'ZEROBroker Pay.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
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
                          control: new SwiperControl(
                              // iconNext: IconData(0xe5af,
                              //     fontFamily: 'MaterialIcons',
                              //     matchTextDirection: true),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40,
                color: Colors.grey[200],
                thickness: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 8, 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Frequently Asked Questions on the Creation of Rental Agreement in Benglore' +
                                '              ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '                             Frequently Asked Questions on the Creation' +
                                'of Rental Agreement in Benglore',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 40,
                color: Colors.grey[200],
                thickness: 20,
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
              Expanded(
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
      ),
    );
  }
}
