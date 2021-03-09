//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/bottom_navigation__buton.dart';
import 'package:demo/widget/custom_list_view_widget.dart';
import 'package:demo/widget/custom_text_form_field.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/flat_button_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../z_b_cash_page.dart';

class FullHouseCleaningPage extends StatefulWidget {
  static String id = 'select_address';

  @override
  _FullHouseCleaningPageState createState() => _FullHouseCleaningPageState();
}

class _FullHouseCleaningPageState extends State<FullHouseCleaningPage> {
  List<String> roomTypes = ['1RK', '1bhk', '2bhk', '3bhk', '4bhk'];

  @override
  Widget build(BuildContext context) {
    final double itemWidth = MediaQuery.of(context).size.width / 2;

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 195,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 15, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        title: 'ZBCash Usage',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.clear,
                        ),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.yellow[800],
                        child: CircleAvatar(
                          radius: 10.5,
                          backgroundColor: Colors.yellow[200],
                          child: CircleAvatar(
                            radius: 9,
                            child: Text(
                              'N',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.yellow[800],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CustomTextWidget(
                        title: 'Earn ZBCash on zero broker orders',
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Divider(),
                  CustomTextWidget(
                    title: 'How do I earn NBCash',
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  Expanded(
                    child: CustomTextWidget(
                      title: 'Place an order on ZeroBroker to earn ZBCash.' +
                          'Exact amount of ZBCash to be earned will be displyed on payment screen.',
                      fontSize: 10,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 300,
                      // margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: CustomTextWidget(
                          title:
                              'Apply ZBCash for instant discounton your next order',
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ZeroBrokerCashIcon(
                onTapIcon: () => Navigator.pushNamed(
                  context,
                  ZBCashPage.id,
                ),
              ),
            )
          ],
          title: Text(
            'Select Your Services',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.pink[50],
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TabSearchBarWidget(
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
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1800,
          // margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => _settingModalBottomSheet(context),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.star_rounded,
                    ),
                    title: CustomTextWidget(
                      title: 'Earn upto \u20B91,000 ZBCash order.',
                      fontSize: 12,
                    ),
                    subtitle: CustomTextWidget(
                      title: 'Apply on next order to get instant discount',
                      fontSize: 10,
                    ),
                    trailing: Icon(
                      Icons.info_outline_rounded,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  //  physics: NeverScroll,
                  padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,

                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
                        ((MediaQuery.of(context).size.height) / 2.25)),
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return SelectServiceGridItem();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
                    title: '\u20B9' + ' 5,199',
                    fontSize: 13,
                    decoration: TextDecoration.lineThrough
                    // fontWeight: FontWeight.bold,
                    ),
                SizedBox(
                  width: 5,
                ),
                CustomTextWidget(
                  title: '4,999',
                  fontSize: 13,
                  // fontWeight: FontWeight.bold,
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.pink[50],
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.pink,
                  )),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: CustomTextWidget(
                  title: 'Extra \u20B9 172 ZBCash discount',
                  fontSize: 8,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CardTextWidget(
              line: 'Floor Scubbing machine',
            ),
            SizedBox(
              height: 3,
            ),
            CardTextWidget(
              line: 'Gov. approved chemicals',
            ),
            SizedBox(
              height: 3,
            ),
            TextAndIconCardWidget(
              title: 'also include balcony and utility areas',
            ),
            SizedBox(
              height: 3,
            ),
            TextAndIconCardWidget(
              title: 'Hard water stains can be removed upto 75%',
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

class TextAndIconCardWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const TextAndIconCardWidget({
    this.icon,
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.check,
          size: 12,
        ),
        SizedBox(
          width: 1,
        ),
        Expanded(
          flex: 1,
          child: Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 9,
              // letterSpacing: 0.2,
            ),
          ),
        )
      ],
    );
  }
}
