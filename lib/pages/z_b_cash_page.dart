//import 'dart:js';

import 'package:demo/pages/recent_transaction.dart';
import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:demo/widget/z_b_cash_app_bar.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

class ZBCashPage extends StatefulWidget {
  static String id = 'z_b_cash';

  @override
  _ZBCashPageState createState() => _ZBCashPageState();
}

class _ZBCashPageState extends State<ZBCashPage> {
  void _showAnimatedTermsAndConditions() {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: 'Title',
          contentText: 'content',
        );
      },
    );
  }

  void _showTermsAndConditions() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetAnimationCurve: Curves.fastLinearToSlowEaseIn,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ), //this right here
            child: Container(
              height: 180,
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Terms and conditions',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                          ),
                          onPressed: () => Navigator.pop(context))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 0, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextAndIconCardWidget(
                          icon: Icons.circle,
                          iconSize: 5,
                          title: 'Get maximum discount of 1,000 with no' +
                              'minimum order value.',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextAndIconCardWidget(
                          icon: Icons.circle,
                          iconSize: 5,
                          title: 'offer valid till 31st mar 2021',
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextAndIconCardWidget(
                          icon: Icons.circle,
                          iconSize: 5,
                          title:
                              'Discount will be applied automatically on chechout if ' +
                                  'you have enough ZBCash balance',
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: MyAppBar(
              title: 'ZBCash',
              onTapHistory: () =>
                  Navigator.pushNamed(context, RecentTransactionsPage.id),
            ),
            pinned: true,
            floating: false,
            snap: false,
            expandedHeight: 210.0,
            flexibleSpace: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: '\u20B92,000 ',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        ZeroBrokerResizedCashIcon(
                          circle3Rad: 8,
                          circle2Rad: 6,
                          circle1Rad: 5.3,
                        ),
                        CustomTextWidget(
                          title: ' ZBCash',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          title: ' will expire on',
                          fontSize: 10,
                          // fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          title: ' 1 Apr 2021',
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 160,
                  child: Card(
                    elevation: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                              tileMode: TileMode.clamp,
                              colors: [
                            Colors.blue[200],
                            Colors.white,
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextWidget(
                                title: ' YOU ARE MISSING OUT ON',
                                fontSize: 14,
                              ),
                              CustomTextWidget(
                                title: ' Rentar\'s Club',
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              CustomTextWidget(
                                title: 'Become a member and get',
                                fontSize: 11,
                              ),
                              CustomTextWidget(
                                title: ' exclusive benifits and rewards',
                                fontSize: 11,
                              ),
                              FlatButtonWidget(
                                // minWidth: 30,
                                buttonTitle: 'join club',
                                color: Colors.pink,
                                onPressFlatButton: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          CircleAvatar(
                            child: Icon(
                              Icons.lock,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1650,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Redeem your rewards ',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextWidget(
                        title: ' claim exciting rewards using NoBroker Cash',
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.builder(
                          //  physics: NeverScroll,
                          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,

                          physics: NeverScrollableScrollPhysics(),

                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return SelectServiceListItem(
                              onTapTermAndConditions: () =>
                                  _showTermsAndConditions(),
                            );
                          },
                        ),
                      ),
                      FlatButtonWidget(
                        color: Colors.pink,
                        minWidth: double.infinity,
                        buttonTitle: 'View All Rewards',
                        onPressFlatButton: () {},
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1650,
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'Earn MorevZBCash ',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomTextWidget(
                        title: ' Offers on Plans and services',
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: GridView.builder(
                          //  physics: NeverScroll,
                          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,

                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 0,
                            crossAxisSpacing: 0,
                            childAspectRatio:
                                ((MediaQuery.of(context).size.width / 2) /
                                    ((MediaQuery.of(context).size.height) /
                                        2.5)),
                          ),
                          itemCount: 9,
                          itemBuilder: (BuildContext context, int index) {
                            return SelectServiceGridItem();
                          },
                        ),
                      ),
                      FlatButtonWidget(
                        color: Colors.pink,
                        minWidth: double.infinity,
                        buttonTitle: 'View All Rewards',
                        onPressFlatButton: () {},
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextAndIconCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  const TextAndIconCardWidget({
    @required this.icon,
    @required this.title,
    this.iconSize,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 3.5,
          ),
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            maxLines: 3,
            style: TextStyle(
              fontSize: 11,
              // letterSpacing: 0.2,
            ),
          ),
        )
      ],
    );
  }
}

class SelectServiceGridItem extends StatelessWidget {
  const SelectServiceGridItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(right: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                    'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                    child: CustomTextWidget(
                      title: '1 RK',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextWidget(
              title: '1 RK Full House Deep Cleaning',
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Earn',
                  fontSize: 10,
                  // decoration: TextDecoration.lineThrough
                  // fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 3,
                ),
                ZeroBrokerResizedCashIcon(
                  circle3Rad: 6,
                  circle2Rad: 4,
                  circle1Rad: 3.5,
                ),
                SizedBox(
                  width: 3,
                ),
                CustomTextWidget(
                  title: 'ZBCash ',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            CustomTextWidget(
              title: ' upto 5% of order value on',
              fontSize: 10,
              // fontWeight: FontWeight.bold,
            ),
            CustomTextWidget(
              title: 'Home SANITIZATION',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            SizedBox(
              height: 8,
            ),
            CustomTextWidget(
              title: 'T & C',
              fontSize: 10,
              decoration: TextDecoration.underline,
            ),
            Center(
              child: FlatButtonWidget(
                buttonTitle: 'Select',
                color: Colors.pink,
                onPressFlatButton: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SelectServiceListItem extends StatelessWidget {
  final Function onTapTermAndConditions;

  const SelectServiceListItem({
    @required this.onTapTermAndConditions,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 8, 10, 3),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 8, 10, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(
              'https://media.istockphoto.com/photos/cute-panda-bear-climbing-in-tree-picture-id523761634?k=6&m=523761634&s=612x612&w=0&h=0L2VZTQvcOVkSmj0ZLL9ntIw2FXqJwZ70fz2Qmq6D-c=',
            ),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: 'Flat 10% off on Packers and Movers',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(3, 0, 3, 1),
                child: CustomTextWidget(
                  title: 'Valid in all cities',
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  title: 'Upto 2,000',
                  fontSize: 10,
                  // decoration: TextDecoration.lineThrough
                  // fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  width: 3,
                ),
                ZeroBrokerResizedCashIcon(
                  circle3Rad: 6,
                  circle2Rad: 4,
                  circle1Rad: 3.5,
                ),
                SizedBox(
                  width: 3,
                ),
                CustomTextWidget(
                  title: 'ZBCash ',
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: onTapTermAndConditions,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title: 'Expirs on :31st March 2021',
                    fontSize: 10,
                    // decoration: TextDecoration.lineThrough
                    // fontWeight: FontWeight.bold,
                  ),
                  CustomTextWidget(
                    title: 'T & C',
                    fontSize: 10,
                    decoration: TextDecoration.underline,
                  ),
                ],
              ),
            ),
            FlatButtonWidget(
              buttonTitle: 'Select',
              color: Colors.pink,
              onPressFlatButton: () {},
            )
          ],
        ),
      ),
    );
  }
}
