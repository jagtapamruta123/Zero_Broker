import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class TabViewTwo extends StatelessWidget {
  Function onTapCall;
  Function onTapSearch;
  TabViewTwo({
    this.onTapCall,
    this.onTapSearch,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabSearchBarWidget(
          iconSearch: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          function: onTapSearch,
          hintText: "Search upto 3 locations",
        ),
        SizedBox(
          height: 3,
        ),
        Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Container(
            height: 180,
            width: double.infinity,

            //MediaQuery.of(context).size.width,
            //
            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 19, 0),
                            child: Text(
                              'For Property Owners',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          CardTextWidget(
                            line: 'faster and verified tenants/Buyers',
                          ),
                          CardTextWidget(
                            line: 'Spent ZERO on Brokerage',
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                        child: Icon(
                          Icons.home_outlined,
                          size: 85,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                ButtonTheme(
                  minWidth: 300,
                  height: 35.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.pink,
                    child: Text("Post Free Property Ad"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
            height: 230,
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
                        title: 'Builders Projects',
                        onTap: null,
                      ),
                    ),
                  );
                })

            //TabBarSecondCardWidget(),
            ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 105,
            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Sale Agreement",
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title:
                                "get Dedicated Property Expert to help you buy your dream home.",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    CustomTextWidget(
                      title: "Create Sale Agreement",
                      fontSize: 10,
                    ),
                    Icon(
                      (Icons.arrow_forward),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onTapCall,
          child: Card(
            child: Container(
              height: 45,
              margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CustomTextWidget(
                        title: "need assistance?",
                        fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        fontSize: 10,
                        title: "we are just call away",
                        color: Colors.black54,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(width: 150),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.blueAccent)),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
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
            Container(
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
            SizedBox(
              height: 3,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: icon,
            ),
            SizedBox(
              height: 3,
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
