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

class BookNowPage extends StatefulWidget {
  static String id = 'nav_home';
  @override
  _BookNowPageState createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
          child: Container(
            height: 1220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.pink[400],
                        Colors.pink[50],
                      ],
                    ),
                  ),
                  // color: Colors.pink[50],
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
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Container(
                          height: 35,
                          child: TextField(
                            readOnly: true,
                            onTap: () {},
                            showCursor: false,
                            enableInteractiveSelection: false,
                            style: TextStyle(
                              fontSize: 5,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              hintText: 'Search for an artical/help',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: ListView.builder(
                    // controller: ,
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => Container(
                      //  height: 200,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          8,
                          8,
                          8,
                          20,
                        ),
                        child: Card(
                          elevation: 5,
                          // margin: EdgeInsets.only(bottom: 10),
                          child: ListTile(
                            trailing: Image.network(
                              'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                              // height: 300,
                              //fit: BoxFit.fill,
                            ),
                            title: Text(
                              'Leagl Documentation made easy',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                  title: '1. No Govt office visits',
                                  fontSize: 10,
                                ),
                                CustomTextWidget(
                                  title: '2. Personal legal assistance',
                                  fontSize: 10,
                                ),
                                CustomTextWidget(
                                  title: '3. Online Payment',
                                  fontSize: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Container(
                  // decoration: BoxDecoration(border: Border.all(color: )),
                  // color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(15, 0, 0, 10),
                        child: CustomTextWidget(
                          title: 'Rental Services',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Container(
                          height: 200,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              2, 0, 2, 0),
                                          child: Text(
                                            'Best Price',
                                            style: TextStyle(fontSize: 8),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20),
                                        child: Icon(
                                          Icons.book_online_outlined,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Rental Agreement',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Divider()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                    // height: 20,
                    // color: Colors.grey[200],
                    // thickness: 40,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                                          style: DefaultTextStyle.of(context)
                                              .style,
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'ZEROBroker Pay.',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
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
                SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
