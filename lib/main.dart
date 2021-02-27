import 'package:demo/pages/click_and_earn.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/home_services_page.dart';
import 'package:demo/pages/movers_and_packers_navigation_bar/moving_cost_within_city_form.dart';
import 'package:demo/pages/packers_and_movers_page.dart';
import 'package:demo/pages/pay_rent_page.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/pages/search_localities_page.dart';
import 'package:demo/pages/zero_broker_support_and_help_page.dart';
import 'package:demo/services/call_msg_service.dart';

import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zero Broker',
      debugShowCheckedModeBanner: false,
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        SearchLocalities.id: (context) => SearchLocalities(),
        PayRent.id: (context) => PayRent(),
        RentalAgreementPage.id: (context) => RentalAgreementPage(),
        ZeroBrokerSupportAndHelp.id: (context) => ZeroBrokerSupportAndHelp(),
        NavHomePage.id: (context) => NavHomePage(),
        PackersAnsMoversPage.id: (context) => PackersAnsMoversPage(),
        MovingCostPage.id: (context) => MovingCostPage(),
        ClickAndEarn.id: (context) => ClickAndEarn(),
        HomeServicePage.id: (context) => HomeServicePage()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(),
    );
  }
}
