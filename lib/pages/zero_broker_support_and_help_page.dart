//import 'dart:js';

import 'package:demo/pages/rental_agreement_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ZeroBrokerSupportAndHelp extends StatefulWidget {
  static String id = 'support_and_help';

  @override
  _ZeroBrokerSupportAndHelpState createState() =>
      _ZeroBrokerSupportAndHelpState();
}

class _ZeroBrokerSupportAndHelpState extends State<ZeroBrokerSupportAndHelp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ZeroBroker Support & Help',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                      child: Container(
                        margin: EdgeInsets.fromLTRB(20, 3, 0, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$index' + '  How can I book a service online?',
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 14,
                              ),
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
