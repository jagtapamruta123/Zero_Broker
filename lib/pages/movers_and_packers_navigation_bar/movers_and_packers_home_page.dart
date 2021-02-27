import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo/pages/movers_and_packers_navigation_bar/moving_cost_within_city_form.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class MPHomePage extends StatefulWidget {
  static String id = 'nav_home';
  @override
  _MPHomePageState createState() => _MPHomePageState();
}

class _MPHomePageState extends State<MPHomePage>
    with SingleTickerProviderStateMixin {
  String _selectedCity;
  String mobileNumber = '9637082374';
  int _currentIndex = 0;
//  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.pink[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CustomTextWidget(
                        title: 'Book Best Packers and Movers at Lowest Price.',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Center(
                    child: CustomTextWidget(
                      title: 'Guaranteed On-Time and Safe Delivery',
                      fontSize: 10,
                    ),
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
                            CustomTextWidget(
                              title: 'Free Cancellation',
                            ),
                            CustomTextWidget(
                              title: 'Dont risk your precious Inventory',
                              fontSize: 8,
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
                  Container(
                    width: double.infinity,
                    height: 20,
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                      color: Colors.pink[200],
                      border: Border.all(
                        color: Colors.pink,
                      ),
                    ),
                    // color: Colors.pink[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextWidget(
                          title: '3.5 / 5',
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
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
                        ),
                        CustomTextWidget(
                          title: '2000 Reviews',
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TabBar(
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'tab1Name',
                ),
                Tab(
                  text: 'tab2Name',
                ),
              ],
            ),
            Container(
              height: 320,
              //flex: 1,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  //=======================tab1=============================
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: DropDownFormField(
                            filled: false,
                            //  contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            titleText: '',
                            hintText: 'Choose city..',
                            value: _selectedCity,
                            onSaved: (value) {
                              setState(() {
                                _selectedCity = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _selectedCity = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Mumbai",
                                "value": "Mumbai",
                              },
                              {
                                "display": "Pune",
                                "value": "Pune",
                              },
                              {
                                "display": "Latur",
                                "value": "Latur",
                              },
                              {
                                "display": "Bengalore",
                                "value": "Bengalore",
                              },
                              {
                                "display": "Soccer Practice",
                                "value": "Soccer Practice",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextWidget(
                          title: 'Moving From',
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          height: 35,
                          child: TextFormField(
                            // maxLength: 1,
                            //cursorColor: Colors.white,
                            decoration: InputDecoration(
                              filled: false,
                              hintText: 'nearest landmark',
                              hintStyle: TextStyle(fontSize: 12),
                              // labelText: 'Nearest landmark',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextWidget(
                          title: 'Moving to',
                          fontWeight: FontWeight.bold,
                        ),
                        Container(
                          height: 35,
                          width: double.infinity,
                          child: TextFormField(
                            // maxLength: 1,
                            //cursorColor: Colors.white,
                            decoration: InputDecoration(
                              // prefixIcon: icon,
                              //fillColor: Colors.black.withOpacity(0.2),
                              filled: false,
                              hintText: 'Nearest landmark',
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              //  labelText: 'Nearest landmark',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Divider(
                          height: 20,
                          // thickness: 2.5,
                        ),
                        FlatButtonWidget(
                          buttonTitle: 'Estimate Moving Cost',
                          color: Colors.pink,
                          onPressFlatButton: () {
                            Navigator.pushNamed(
                              context,
                              MovingCostPage.id,
                            );
                          },
                        )
                      ],
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextWidget(
                                title: 'Moving From',
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                height: 35,
                                child: TextFormField(
                                  // maxLength: 1,
                                  //cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    filled: false,
                                    hintText: 'nearest landmark',
                                    hintStyle: TextStyle(fontSize: 12),
                                    // labelText: 'Nearest landmark',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              CustomTextWidget(
                                title: 'Moving to',
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                height: 35,
                                width: double.infinity,
                                child: TextFormField(
                                  // maxLength: 1,
                                  //cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    // prefixIcon: icon,
                                    //fillColor: Colors.black.withOpacity(0.2),
                                    filled: false,
                                    hintText: 'Nearest landmark',
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    //  labelText: 'Nearest landmark',
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                height: 20,
                                // thickness: 2.5,
                              ),
                              FlatButtonWidget(
                                buttonTitle: 'Get Quotes',
                                color: Colors.pink,
                                onPressFlatButton: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Center(
                child: Card(
                  elevation: 10,
                  child: Container(
                    width: 290,
                    height: 120,
                    //margin: EdgeInsets.only(),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: 'Best Safety Standard.',
                                fontWeight: FontWeight.bold,
                              ),
                              CustomTextWidget(
                                title: 'Using Gloves and Masks',
                                fontWeight: FontWeight.bold,
                              ),
                              CardTextWidget(
                                line: '100% contactless service',
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CardTextWidget(
                                line: 'Usage of Aarogya Setu app',
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
                        Container(
                          child: Image.network(
                            'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                            fit: BoxFit.fill,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: 30,
            ),
            Container(
              // width: double.infinity,
              height: 400,
              margin: EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'How Zero Broker Packers & Movers Works ?',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      // scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 4,
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
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: CustomTextWidget(
                title: 'Why ZeroBroker\'s Packers and Movers ?',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 420,
              child: ListView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (BuildContext context, int count) {
                  return Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Card(
                      child: ListTile(
                        title: CustomTextWidget(
                          title: 'Best Price',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              title: '100% price and service gurantee',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CardTextWidget(
                              line: '100% contactless service',
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CardTextWidget(
                              line: '100% contactless service',
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CardTextWidget(
                              line: '100% contactless service',
                            ),
                          ],
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue[50],
                          child: Icon(
                            Icons.wifi_protected_setup_outlined,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 360,
              // width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    title: 'Customer Reviews',
                    fontSize: 20,
                    //fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 20,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 4.0),
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
                                      text:
                                          '"  I am really excite about using ',
                                      style: DefaultTextStyle.of(context).style,
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
            Container(
              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Center(
                child: CustomTextWidget(
                  title: 'Common Questions',
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              height: 300,
              // flex: 1,
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
            Container(
              margin: EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: CustomTextWidget(
                title: 'Tips & Guides',
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(35, 0, 50, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                            fit: BoxFit.fill,
                          ),
                          Divider(),
                          CustomTextWidget(
                            title: 'How to choose Your Moving Company',
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                          Text(
                            'Choices for which is the best packers in Bengalor' +
                                'are many.What one should really see the range of facilitirs',
                            maxLines: 2,
                            style: TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  );
                },
                viewportFraction: 0.8,
                itemCount: 3,
                autoplay: true,
                itemWidth: 310,
                itemHeight: 180,
                layout: SwiperLayout.DEFAULT,
                pagination: new SwiperPagination(
                    // alignment: Alignment.bottomCenter,
                    // builder: new DotSwiperPaginationBuilder(
                    //     color: Colors.white, activeColor: Colors.white),
                    ),
                control: new SwiperControl(
                    // color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
