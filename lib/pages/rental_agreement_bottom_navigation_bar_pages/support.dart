import 'package:demo/pages/zero_broker_support_and_help_page.dart';
import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavSupportPage extends StatefulWidget {
  @override
  _NavSupportPageState createState() => _NavSupportPageState();
}

class _NavSupportPageState extends State<NavSupportPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Container(
                height: 40,
                child: TextField(
                  readOnly: true,
                  onTap: () {},
                  showCursor: false,
                  enableInteractiveSelection: false,
                  style: TextStyle(
                    fontSize: 5,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for an artical/help',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: CustomTextWidget(
                title: 'Browse Topics',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ZeroBrokerSupportAndHelp.id);
                    },
                    child: Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.home_outlined,
                                ),
                              ),
                              CustomTextWidget(
                                title: '   home' + ' services',
                              )
                            ],
                          )),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
