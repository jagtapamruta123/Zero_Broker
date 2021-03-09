//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/pay_rent_house_tab_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PayUtilityBillsPage extends StatefulWidget {
  static String id = 'support_and_help';

  @override
  _PayUtilityBillsPageState createState() => _PayUtilityBillsPageState();
}

class _PayUtilityBillsPageState extends State<PayUtilityBillsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: true,
          title: Row(
            //  crossAxisAlignment: CrossAxisAlignment.end,
            //  mainAxisAlignment: MainAxisAlignment.end,
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
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: Container(
              height: 50,
              width: double.infinity,
              color: Colors.blue,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: TabSearchBarWidget(
                  iconSearch: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20,
                  ),
                  function: () {},
                  hintText: "Search for bill payments",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 250,
                //  width: double.infinity,
                margin: EdgeInsets.fromLTRB(0, 5, 5, 0),
                child: GridView.builder(
                    itemCount: 6,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      // childAspectRatio: ((MediaQuery.of(context).size.width / 2) /
                      //     ((MediaQuery.of(context).size.height) / 2.25)),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Center(
                          child: TabViewBuyCardItem(
                            hoverMsg: 'new',
                            icon: Icon(
                              Icons.car_rental,
                              size: 40,
                            ),
                            title: 'Electricity',
                            onTap: null,
                          ),
                        ),
                      );
                    })

                //TabBarSecondCardWidget(),
                ),
            CustomTextWidget(
              title: 'Top Questions Asked ',
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            Container(
              height: 450,
              // flex: 1,
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

class TabViewBuyCardItem extends StatelessWidget {
  Widget icon;
  String title;
  Function onTap;
  String hoverMsg;
  TabViewBuyCardItem({
    this.hoverMsg,
    @required this.icon,
    @required this.title,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: false,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                  child: Text(
                    hoverMsg,
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: icon,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
