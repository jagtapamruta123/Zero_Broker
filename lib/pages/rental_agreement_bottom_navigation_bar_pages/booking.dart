import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBookingPage extends StatefulWidget {
  @override
  _NavBookingPageState createState() => _NavBookingPageState();
}

class _NavBookingPageState extends State<NavBookingPage>
    with SingleTickerProviderStateMixin {
  bool isBookNow = false;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState

    _tabController = TabController(vsync: this, length: 2);
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
        body: Container(
      height: double.maxFinite,
      child: Column(
        children: [
          Container(
            child: TabBar(
              labelColor: Colors.black,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'ONGOING',
                ),
                Tab(
                  text: 'HISTORY',
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 40,
                    ),
                    CustomTextWidget(
                      title: 'No Booking Found',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 280,
                      child: CustomTextWidget(
                        title: 'Looks like you dont have by booking here ' +
                            '     But you can request for service now.',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FlatButton(
                      color: Colors.pink,
                      onPressed: () => {
                        Navigator.of(context).pushNamed(
                          RentalAgreementPage.id,
                        ),
                      },
                      child: Text(
                        'Book Now',
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 40,
                    ),
                    CustomTextWidget(
                      title: 'No Booking Found',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 280,
                      child: CustomTextWidget(
                        title: 'Looks like you dont have by booking here ' +
                            '     But you can request for service now.',
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FlatButton(
                      color: Colors.pink,
                      onPressed: () => {
                        // isBookNow = true;
                        // print('Book now pressed'),

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RentalAgreementPage(),
                            // Pass the arguments as part of the RouteSettings. The
                            //  reads the arguments from these settings.
                            settings: RouteSettings(
                              arguments: isBookNow,
                            ),
                          ),
                        )

                        // Navigator.of(context).pushNamed(
                        //   RentalAgreementPage.id,
                        //   arguments: isBookNow = true,
                        // ),
                      },
                      child: Text(
                        'Book Now',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
