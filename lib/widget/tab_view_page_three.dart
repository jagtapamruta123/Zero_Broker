import 'package:demo/pages/property_owner_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:demo/widget/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class TabViewPageThree extends StatelessWidget {
  Function onTapCallThree;
  Function onTapSearch;
  final onTapMoversAndPackers;
  final onTapPayRent;
  final onTapRentalAgreement;
  final onTapClickEarn;
  final onTapHomeServices;
  final Function onTapMPBottomCard;
  final Function onTapPRBottomCard;
  final Function onTapRABottomCard;
  final Function onTapPayUtilitiesBottomCard;
  // final Function onTapKnowYourRent;
  // final Function onTapForNRIBottomCard;
  final Function onTapRelocationServiceBottomCard;

  TabViewPageThree({
    @required this.onTapCallThree,
    @required this.onTapSearch,
    @required this.onTapMoversAndPackers,
    @required this.onTapPayRent,
    @required this.onTapRentalAgreement,
    @required this.onTapClickEarn,
    @required this.onTapHomeServices,
    @required this.onTapMPBottomCard,
    @required this.onTapRABottomCard,
    // @required this.onTapKnowYourRent,
    @required this.onTapPRBottomCard,
    //  @required this.onTapForNRIBottomCard,
    @required this.onTapPayUtilitiesBottomCard,
    @required this.onTapRelocationServiceBottomCard,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabSearchBarWidget(
          function: onTapSearch,
          iconSearch: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
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
                    color: Colors.pink,
                    onPressed: () =>
                        Navigator.pushNamed(context, PropertyOwnerPage.id),
                    child: Text("Post Free Property Ad"),
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          elevation: 3,
          child: Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
            child: TabBarSecondCardWidget(
              onTapMoversAndPackers: onTapMoversAndPackers,
              onTapPayRent: onTapPayRent,
              onTapRentalAgreement: onTapRentalAgreement,
              onTapClickEarn: onTapClickEarn,
              onTapHomeServices: onTapHomeServices,
            ),
          ),
        ),
        InkWell(
          onTap: onTapMPBottomCard,
          child: Card(
            child: Container(
                height: 75,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Movers n Packers",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Great Price,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "On Time,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Safe Delivery",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: onTapPRBottomCard,
          child: Card(
            child: Container(
                height: 85,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Pay Rent By Credit/Debit card",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Start Paying Rent and earn miles,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "CashBack and rewards",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: onTapPayUtilitiesBottomCard,
          child: Card(
            child: Container(
                height: 75,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Pay Utility Bills",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Great Price,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "On Time,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Safe Delivery",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),

        // InkWell(
        //   onTap: onTapKnowYourRent,
        //   child: Card(
        //     child: Container(
        //         height: 80,
        //         margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Expanded(
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.stretch,
        //                 children: [
        //                   CustomTextWidget(
        //                     title: "Know Your Rent",
        //                     fontWeight: FontWeight.bold,
        //                   ),
        //                   SizedBox(
        //                     height: 4,
        //                   ),
        //                   CustomTextWidget(
        //                     fontSize: 10,
        //                     title: "Great Price,",
        //                     color: Colors.black54,
        //                     fontWeight: FontWeight.normal,
        //                   ),
        //                   CustomTextWidget(
        //                     fontSize: 10,
        //                     title: "On Time,",
        //                     color: Colors.black54,
        //                     fontWeight: FontWeight.normal,
        //                   ),
        //                   CustomTextWidget(
        //                     fontSize: 10,
        //                     title: "Safe Delivery",
        //                     color: Colors.black54,
        //                     fontWeight: FontWeight.normal,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Container(
        //               margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
        //               child: Icon(
        //                 Icons.home,
        //                 size: 50,
        //                 color: Colors.blue[100],
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Row(
        //                 children: [
        //                   CustomTextWidget(
        //                     title: "Explore",
        //                   ),
        //                   Icon(
        //                     (Icons.arrow_forward),
        //                   )
        //                 ],
        //               ),
        //             )
        //           ],
        //         )),
        //   ),
        // ),

        InkWell(
          onTap: onTapRentalAgreement,
          child: Card(
            child: Container(
                height: 75,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Rental Agreement",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Great Price,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "On Time,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Safe Delivery",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: null,
          child: Card(
            child: Container(
                height: 75,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title: "Zero Broker for NRI\'s",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Great Price,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "On Time,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Safe Delivery",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        InkWell(
          onTap: onTapRelocationServiceBottomCard,
          child: Card(
            child: Container(
                height: 89,
                margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomTextWidget(
                            title:
                                "Zero Broker Relocation Services for Corporates",
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "Get in touch with us for end to",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "end Home search and relocation,",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                          CustomTextWidget(
                            fontSize: 10,
                            title: "services foryour employes",
                            color: Colors.black54,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 3, 10),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.blue[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CustomTextWidget(
                            title: "Explore",
                          ),
                          Icon(
                            (Icons.arrow_forward),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
        GestureDetector(
          onTap: onTapCallThree,
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
