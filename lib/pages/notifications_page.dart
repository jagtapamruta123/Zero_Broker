import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  static String id = 'notification_page';
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage>
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
        appBar: AppBar(
          centerTitle: true,
          title: CustomTextWidget(
            title: 'Notifications',
          ),
        ),
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
                      text: 'Feedback',
                    ),
                    Tab(
                      text: 'Chat',
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
                          Icons.book,
                          size: 60,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 280,
                          child: CustomTextWidget(
                            title: 'Properties that you have shown ' +
                                'interst in, will appear here.',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 0, 3, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.book_online_outlined,
                            size: 35,
                          ),
                          SizedBox(height: 5),
                          CustomTextWidget(
                            title: 'Welcome Back User',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Divider(),
                          FlatButtonWidget(
                            color: Colors.pink,
                            minWidth: double.infinity,
                            onPressFlatButton: () => {},
                            buttonTitle: 'start with new chat',
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
