import 'package:demo/widget/custom_text_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class QuestionAnsExpandedWidget extends StatelessWidget {
  final Icon icon;
  String que;
  String ans;
  QuestionAnsExpandedWidget({
    this.icon,
    @required this.que,
    @required this.ans,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                  ),
                  header: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: Icon(
                              Icons.question_answer_outlined,
                              size: 15,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            que,
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      )),
                  // collapsed: Text(
                  //   'loremIpsum',
                  //   softWrap: true,
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  expanded:
                      //Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      ///children: <Widget>[
                      // for (var _ in Iterable.generate(5))
                      Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 75,
                      decoration: BoxDecoration(color: Colors.pink[50]),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                          child: RichText(
                            text: TextSpan(
                              text: ans,
                              style: TextStyle(
                                fontSize: 8,
                                color: Colors.black,
                              ),
                              // children: <TextSpan>[
                              //   TextSpan(
                              //       text: 'bold',
                              //       style:
                              //           TextStyle(fontWeight: FontWeight.bold)),
                              //   TextSpan(text: ' world!'),
                              // ],
                            ),
                            //overflow: TextOverflow.fade,
                          )),
                    ),
                  ),
                  //  ],
                  // ),
                  builder: (_, collapsed, expanded) {
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      child: Expandable(
                        collapsed: collapsed,
                        expanded: expanded,
                        theme: const ExpandableThemeData(crossFadePoint: 0),
                      ),
                    );
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

class PaymentStepCardWidget extends StatelessWidget {
  String number;
  String title;
  String subtitle;

  PaymentStepCardWidget({
    @required this.number,
    @required this.title,
    @required this.subtitle,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
          ),
          margin: EdgeInsets.fromLTRB(150, 45, 150, 10),
          child: Icon(
            Icons.dashboard_customize,
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: CircleAvatar(
            child: Text(number),
            radius: 18,
            backgroundColor: Colors.pink,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        CustomTextWidget(
          title: title,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(
          height: 2,
        ),
        CustomTextWidget(
          title: subtitle,
          fontSize: 8,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }
}
