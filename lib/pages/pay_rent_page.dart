import 'package:demo/widget/custom_text_form_field.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PayRent extends StatefulWidget {
  static String id = 'pay_rent';
  @override
  _PayRentState createState() => _PayRentState();
}

class _PayRentState extends State<PayRent> with SingleTickerProviderStateMixin {
  int _current = 0;
  TabController _tabController;
  bool isCreditInfoAccepted = false;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              child: Icon(
                Icons.mode_sharp,
                color: Colors.white,
                size: 20,
              ),
              radius: 14,
              backgroundColor: Colors.pink[400],
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              'ZERO',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'BROKER',
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 500,
                  height: 200,
                  //
                  color: Colors.pink[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(50, 10, 10, 0),
                        child: CustomTextWidget(
                          title: "Pay Rent or Maintenace with credit card ",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          // controller: ,
                          itemCount: 2,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              Container(
                            height: 170,
                            width: 310,
                            child: Card(
                              margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
                              child: ListTile(
                                  title: Text(
                                    'Now Pay Society Maintanace too',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'All your property payments at one place-rent ,maintainance,deposite,token,',
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
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 30,
                  color: Colors.pinkAccent[400],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 0),
                    child: Wrap(
                      spacing: 20,
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.panorama_photosphere_select,
                          color: Colors.white,
                        ),
                        CustomTextWidget(
                          title: 'Lowest Charges.Instant Transfer.',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 52,
                        ),
                        Icon(
                          Icons.info,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 105,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: CarouselSlider.builder(
                    itemCount: 6,
                    itemBuilder:
                        (BuildContext context, int itemIndex, int options) =>
                            Card(
                      child: Container(
//height: 65,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 15,
                                  margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 2, 4, 2),
                                      child: CustomTextWidget(
                                        title: 'Offer',
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                                  width: 200,
                                  child: Text(
                                    '10% cashback upto1250 on millenia cards using payzapp',
                                    maxLines: 3,
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 5, 5, 0),
                                  child: Icon(
                                    Icons.atm_outlined,
                                    size: 45,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: CustomTextWidget(
                                title: 'Click fot T & C',
                                fontSize: 6,
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // imgList.map((url) {
                                  // int index = imgList.indexOf(url);
                                  // return
                                  Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _current == 0
                                          ? Color.fromRGBO(25, 0, 0, 0.9)
                                          : Color.fromRGBO(0, 0, 25, 0.4),
                                    ),
                                  )
                                ]
                                // }

                                //.toList(),
                                )
                          ],
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                        autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 2),
                        enlargeCenterPage: true,
                        viewportFraction: 0.9,
                        aspectRatio: 1.0,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: Colors.blue[100],
                          size: 30,
                        ),
                        iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'House Rent',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: Colors.blue[100],
                          size: 30,
                        ),
                        iconMargin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child: Text(
                          'Society Maintenence',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: Colors.blue[100],
                          size: 30,
                        ),
                        iconMargin: EdgeInsets.fromLTRB(0, 10, 15, 0),
                        child: Text(
                          'Office/Shop Rent',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: Colors.blue[100],
                          size: 30,
                        ),
                        iconMargin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Property Taken',
                          style: TextStyle(color: Colors.black, fontSize: 8),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              label: 'your name',
                              icon: Icon(
                                Icons.person,
                                size: 15,
                              ),
                            ),
                            CustomTextFormField(
                              label: 'phone Number',
                              icon: Icon(
                                Icons.phone,
                                size: 15,
                              ),
                            ),
                            CustomTextFormField(
                              label: 'your email address',
                              icon: Icon(
                                Icons.email,
                                size: 15,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(14, 0, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // margin: EdgeInsets.fromLTRB(14, 0, 0, 50),
                                    child: Checkbox(
                                      value: isCreditInfoAccepted,
                                      onChanged: (bool value) {
                                        isCreditInfoAccepted = value;
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    // margin: EdgeInsets.fromLTRB(0, 14, 10, 0),
                                    child: Text(
                                      'You hereby consent to ZeroBroker receiveing your Credit Information from Experian for facilitatong such credit information to you as sa value add feature when you see ZeroBroker\'s Service.It will not impact your score.',
                                      maxLines: 6,
                                      style: TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                minWidth: double.infinity,
                                color: isCreditInfoAccepted
                                    ? Colors.pink
                                    : Colors.pink[100],
                                // splashColor: Colors.pink,
                                onPressed: () {},
                                child: Text('Get Started'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                              child: Container(
                                height: 60,
                                width: 320,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.blue[50],
                                ),
                                //color: Colors.orange[50],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 0, 0),
                                      child: Icon(
                                        Icons.surround_sound_sharp,
                                        color: Colors.blue[200],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '24/7 Instant Transfers',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 8,
                                              letterSpacing: 0.3,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 15,
                                              width: 200,
                                              child: Text(
                                                'Your payment will be transferred instamntly to your\'s account*',
                                                maxLines: 2,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 0.3,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.8,
                                    ),
                                    Icon(
                                      Icons.atm_rounded,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 350,
                              color: Colors.blue[50],
                              margin: EdgeInsets.fromLTRB(15, 20, 5, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 5, 0),
                                    child: CustomTextWidget(
                                      title: 'Earn money with Broker Pay',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(20, 10, 5, 0),
                                    child: CustomTextWidget(
                                      title:
                                          'Start paying rent using your credit card and earn miles,cashback and reward points.',
                                      fontSize: 8,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 25, 15, 0),
                                    child: Container(
                                      height: 60,
                                      width: 320,

                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.blue[50],
                                          border: Border.all(
                                            color: Colors.blue,
                                          )),
                                      //color: Colors.orange[50],
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 0, 0, 0),
                                            child: Icon(
                                              Icons.bubble_chart,
                                              color: Colors.blue[200],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 5, 0, 0),
                                            child: Container(
                                              height: 25,
                                              width: 200,
                                              child: Text(
                                                'Your payment will be transferred instamntly to your\'s account*',
                                                maxLines: 3,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w100,
                                                  letterSpacing: 0.3,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(25, 20, 10, 0),
                                    child: Text(
                                      '*This is calculated assuming ban annual rent of 4.5 Lacks on Club Vistara SBI card PRIME(premium) ',
                                      style: TextStyle(fontSize: 7),
                                    ),
                                  ),

                                  //;;;;;;;;;;;;;;;;;;;;;start from here''''''''''''''''''
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(),
                        Container(),
                        Container()
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
