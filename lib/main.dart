import 'package:demo/pages/login_pages/login.dart';
import 'package:demo/pages/click_and_earn.dart';
import 'package:demo/pages/home_page.dart';
import 'package:demo/pages/home_service_bottom_navigation/home_service_on_item_click_page.dart';
import 'package:demo/pages/home_service_bottom_navigation/select_apartment_type.dart';
import 'package:demo/pages/home_services_page.dart';
import 'package:demo/pages/movers_and_packers_navigation_bar/moving_cost_within_city_form.dart';
import 'package:demo/pages/notifications_page.dart';
import 'package:demo/pages/packers_and_movers_page.dart';
import 'package:demo/pages/pay_rent_page.dart';
import 'package:demo/pages/pay_utilities_bills.dart';
import 'package:demo/pages/property_owner_page.dart';
import 'package:demo/pages/property_pages/location_page.dart';
import 'package:demo/pages/property_pages/post_new_property.dart';
import 'package:demo/pages/property_pages/property_details.dart';
import 'package:demo/pages/property_pages/property_owner_add.dart';
import 'package:demo/pages/recent_transaction.dart';
import 'package:demo/pages/rental_agreement_bottom_navigation_bar_pages/home_page.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/pages/search_localities_page.dart';
import 'package:demo/pages/z_b_cash_page.dart';
import 'package:demo/pages/zero_broker_support_and_help_page.dart';
import 'package:demo/provider/theme_provider.dart';
import 'package:demo/services/call_msg_service.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'pages/home_service_bottom_navigation/home_service_card_item_pages/card_item_page.dart';
import 'pages/home_service_bottom_navigation/home_service_card_item_pages/select_home_service_page.dart';
import 'pages/home_service_bottom_navigation/painting_consultation_page.dart';
import 'pages/home_service_bottom_navigation/select_address_page.dart';
import 'pages/property_pages/property_completion_steps/add_slot_schedular_page.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      themeMode: ThemeMode.system,
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      routes: {
        LogInComponantPage.id: (context) => LogInComponantPage(),
        MyHomePage.id: (context) => MyHomePage(),
        SearchLocalities.id: (context) => SearchLocalities(),
        PayRent.id: (context) => PayRent(),
        RentalAgreementPage.id: (context) => RentalAgreementPage(),
        ZeroBrokerSupportAndHelp.id: (context) => ZeroBrokerSupportAndHelp(),
        NavHomePage.id: (context) => NavHomePage(),
        PackersAnsMoversPage.id: (context) => PackersAnsMoversPage(),
        MovingCostPage.id: (context) => MovingCostPage(),
        ClickAndEarn.id: (context) => ClickAndEarn(),
        HomeServicePage.id: (context) => HomeServicePage(),
        HomeserviceItemPage.id: (context) => HomeserviceItemPage(),
        ExpertPaintingConsultationPage.id: (context) =>
            ExpertPaintingConsultationPage(),
        SelectApartmentType.id: (context) => SelectApartmentType(),
        SelectAddressPage.id: (context) => SelectAddressPage(),
        PaintingItemPage.id: (context) => PaintingItemPage(),
        FullHouseCleaningPage.id: (context) => FullHouseCleaningPage(),
        ZBCashPage.id: (context) => ZBCashPage(),
        RecentTransactionsPage.id: (context) => RecentTransactionsPage(),
        NotificationsPage.id: (context) => NotificationsPage(),
        PayUtilityMainPage.id: (context) => PayUtilityMainPage(),
        PropertyOwnerPage.id: (context) => PropertyOwnerPage(),
        PostNewPropertyPage.id: (context) => PostNewPropertyPage(),
        PropertyOwnerAddPage.id: (context) => PropertyOwnerAddPage(),
        PropertyDetailsPage.id: (context) => PropertyDetailsPage(),
        MapView.id: (context) => MapView(),
        AddSlotPage.id: (context) => AddSlotPage()
      },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: MyHomePage(),
    );
  }
}
