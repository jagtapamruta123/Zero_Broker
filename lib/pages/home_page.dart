import 'package:demo/drawer_screen.dart';
import 'package:demo/pages/click_and_earn.dart';
import 'package:demo/pages/home_services_page.dart';
import 'package:demo/pages/notifications_page.dart';
import 'package:demo/pages/packers_and_movers_page.dart';
import 'package:demo/pages/pay_rent_page.dart';
import 'package:demo/pages/pay_utilities_bills.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/pages/search_localities_page.dart';
import 'package:demo/pages/z_b_cash_page.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:demo/widget/tab_view_page_one.dart';
import 'package:demo/widget/tab_view_page_three.dart';
import 'package:demo/widget/tab_view_page_two.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  static String id = 'home_page';
  MyHomePage({
    Key key,
  }) : super(key: key);
// final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;
  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  final String number = '9637082374';
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

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
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawerWidget(),
      appBar: AppBar(
        //backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.dehaze,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            //Scaffold.of(context).openDrawer();
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
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
            Text(
              'BROKER',
              style: TextStyle(
                color: Colors.black54,
              ),
            )
          ],
        ),

        actions: [
          ZeroBrokerCashIcon(
            onTapIcon: () => Navigator.pushNamed(
              context,
              ZBCashPage.id,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(
              context,
              NotificationsPage.id,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.notifications_active_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1500,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
                  child: Text(
                    'World\'s Largest Zero Brokerage ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(125, 0, 0, 0),
                  child: Text(
                    'Property Site',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orange[50],
                    ),
                    //color: Colors.orange[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                          child: Icon(
                            Icons.surround_sound_sharp,
                            color: Colors.yellow[800],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Click here',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            letterSpacing: 0.3,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 0.8,
                        ),
                        Text(
                          'Zero Broker Real Estate Report 2020!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w100,
                            letterSpacing: 0.3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: CustomTabBarTitle(
                    tabController: _tabController,
                    tab1Name: 'Rent',
                    tab2Name: 'Buy',
                    tab3Name: 'Commertial',
                  ),
                ),
                Expanded(
                  //flex: 1,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      //=======================tab1=============================
                      TabViewPageOneWidget(
                        onTapPayUtilityBill: () =>
                            Navigator.pushNamed(context, PayUtilityMainPage.id),
                        onTapCardItemHomeServices: () {
                          Navigator.pushNamed(context, HomeServicePage.id);
                        },
                        onTapCardItemClickEarn: () {
                          Navigator.pushNamed(context, ClickAndEarn.id);
                        },
                        onTapCardItemMoversAndPackers: () {
                          Navigator.pushNamed(context, PackersAnsMoversPage.id);
                        },
                        onTapSearch: () {
                          Navigator.pushNamed(context, SearchLocalities.id);
                        },
                        onTapToCall: () => {_service.call(number)},
                        onTapCardItemPayRent: () {
                          Navigator.pushNamed(context, PayRent.id);
                        },
                        onTapCardItemRentalAgreement: () {
                          Navigator.pushNamed(context, RentalAgreementPage.id);
                        },
                        onTapMPBottomCard: () => Navigator.pushNamed(
                            context, PackersAnsMoversPage.id),
                        onTapPRBottomCard: () =>
                            Navigator.pushNamed(context, PayRent.id),
                        onTapRABottom: () => Navigator.pushNamed(
                            context, RentalAgreementPage.id),
                      ),

                      //tab2---------------------
                      TabViewTwo(
                        onTapSearch: () {
                          Navigator.pushNamed(context, SearchLocalities.id);
                        },
                        onTapCall: () => {_service.call(number)},
                      ),

                      //tab3=========================
                      TabViewPageThree(
                        onTapPayUtilitiesBottomCard: () =>
                            Navigator.pushNamed(context, PayUtilityMainPage.id),
                        onTapMPBottomCard: () => Navigator.pushNamed(
                            context, PackersAnsMoversPage.id),
                        onTapPRBottomCard: () =>
                            Navigator.pushNamed(context, PayRent.id),
                        onTapRABottomCard: () => Navigator.pushNamed(
                            context, RentalAgreementPage.id),
                        onTapSearch: () {
                          Navigator.pushNamed(context, SearchLocalities.id);
                        },
                        onTapPayRent: () {
                          Navigator.pushNamed(context, PayRent.id);
                        },
                        onTapRentalAgreement: () {
                          Navigator.pushNamed(context, RentalAgreementPage.id);
                        },
                        onTapClickEarn: () {
                          Navigator.pushNamed(context, ClickAndEarn.id);
                        },
                        onTapHomeServices: () {
                          Navigator.pushNamed(context, HomeServicePage.id);
                        },
                        onTapMoversAndPackers: () {
                          Navigator.pushNamed(context, PackersAnsMoversPage.id);
                        },
                        onTapCallThree: () => {_service.call(number)},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
