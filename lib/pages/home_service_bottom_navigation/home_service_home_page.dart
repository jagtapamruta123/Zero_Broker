import 'package:demo/pages/home_service_bottom_navigation/home_service_on_item_click_page.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../rental_agreement_page.dart';
import 'home_service_card_item_pages/card_item_page.dart';

class HomeserviceHomePage extends StatefulWidget {
  static String id = 'nav_home';
  @override
  _HomeserviceHomePageState createState() => _HomeserviceHomePageState();
}

class _HomeserviceHomePageState extends State<HomeserviceHomePage> {
  String _selectCity;
  String mobileNumber = '9637082374';
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 320,
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
                  TabSearchBarWidget(
                    iconSearch: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20,
                    ),
                    function: () {},
                    hintText: "Search For Service",
                    enableBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 140,
                    child: ListView.builder(
                      // controller: ,
                      itemCount: 5,
                      shrinkWrap: true,

                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) => Card(
                        elevation: 10,
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          width: 290,
                          height: 105,
                          //margin: EdgeInsets.only(),
                          child: Row(
                            children: [
                              Container(
                                width: 120,
                                height: 140,
                                child: Image.network(
                                  'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                                  fit: BoxFit.fill,
                                ),
                              ),
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
                            ],
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
              height: 350,
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
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
                      Navigator.pushNamed(context, PaintingItemPage.id);
                    },
                    child: Card(
                      color: Colors.pink[50],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: Colors.orange[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                              child: Text(
                                'Best Price',
                                style: TextStyle(
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Icon(
                              Icons.book_online_outlined,
                              size: 40,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Rental Agreement',
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
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int count) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        HomeserviceItemPage.id,
                      );
                    },
                    child: Card(
                      child: Container(
                        width: 250,
                        height: 85,
                        //margin: EdgeInsets.only(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    title: 'Book free Consulation',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Expanded(
                                    child: CustomTextWidget(
                                      title:
                                          'Book your free consultation to get accurate quote.',
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextWidget(
                                    title: 'Best Safety Standard.',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                child: Image.network(
                                  'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                                  // fit: BoxFit.fill,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
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
