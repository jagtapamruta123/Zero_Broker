//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentTransactionsPage extends StatefulWidget {
  static String id = 'recent_transactions';

  @override
  _RecentTransactionsPageState createState() => _RecentTransactionsPageState();
}

class _RecentTransactionsPageState extends State<RecentTransactionsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recent Transactions',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 5, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.book_online,
                        ),
                        title: CustomTextWidget(
                          title: 'welcome Bonus',
                          fontSize: 12,
                        ),
                        trailing: Container(
                          margin: EdgeInsets.only(
                            top: 5,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                title: '+ \u20B92,000',
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              CustomTextWidget(
                                title: '15 FEB 2021',
                                fontSize: 6,
                              ),
                            ],
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                                child: Text(
                                  'Success',
                                  style: TextStyle(
                                    fontSize: 8,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            CustomTextWidget(
                              title: 'order Id :',
                              fontSize: 8,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
