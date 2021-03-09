import 'package:demo/widget/z_b_icon.dart';
import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

// class AnimatedAppBar extends StatelessWidget {
//   AnimationController colorAnimationController;
//   Animation colorTween, homeTween, workOutTween, iconTween, drawerTween;
//   Function onPressed;

//   AnimatedAppBar({
//     @required this.colorAnimationController,
//     @required this.onPressed,
//     @required this.colorTween,
//     @required this.homeTween,
//     @required this.iconTween,
//     @required this.drawerTween,
//     @required this.workOutTween,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//             height: 80,
//             child: AnimatedBuilder(
//               animation: colorAnimationController,
//               builder: (context, child) => AppBar(
//                 leading: IconButton(
//                   icon: Icon(
//                     Icons.dehaze,
//                     color: drawerTween.value,
//                   ),
//                   onPressed: onPressed,
//                 ),
//                 backgroundColor: colorTween.value,
//                 elevation: 0,
//                 titleSpacing: 0.0,
//                 title: Row(
//                   children: <Widget>[
//                     Text(
//                       "Hello  ",
//                       style: TextStyle(
//                           color: homeTween.value,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           letterSpacing: 1),
//                     ),
//                     Text(
//                       'username',
//                       style: TextStyle(
//                           color: workOutTween.value,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           letterSpacing: 1),
//                     ),
//                   ],
//                 ),
//                 actions: <Widget>[
//                   Icon(
//                     Icons.notifications,
//                     color: iconTween.value,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(7),
//                     child: CircleAvatar(
//                       backgroundImage:
//                           NetworkImage('image_url'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );

//   }
// }

class MyAppBar extends StatelessWidget {
  final double barHeight = 66.0;
  final Function onTapHistory;
  final String title;

  const MyAppBar({
    this.onTapHistory,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ZeroBrokerCashIcon(),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7, 0, 0, 2),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Spacer(),
          Stack(
            children: [
              Icon(
                Icons.refresh_outlined,
                size: 20,
              ),
            ],
          ),
          SizedBox(
            width: 2,
          ),
          InkWell(
            onTap: onTapHistory,
            child: CustomTextWidget(
              title: 'History',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 60.0;

  const MyFlexiableAppBar();

  @override
  Widget build(BuildContext context) {
    //  final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      //  padding: new EdgeInsets.only(top: statusBarHeight),
      //   height: statusBarHeight + appBarHeight,
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: new Text(
                      "\u20B9 2,000",
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 29.0),
                    ),
                  ),
                  Container(
                    child: new Text("Total Balance",
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 10.0)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                children: [
                  Expanded(
                    child: AppBarCardItem(
                      title: "Redeem",
                      subTitle: 'Spend ZBCash',
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: AppBarCardItem(
                      title: 'Earn',
                      subTitle: 'more ZBCash',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
        color: Color(0xff013db7),
      ),
    );
  }
}

class AppBarCardItem extends StatelessWidget {
  final String title;
  final String subTitle;
  const AppBarCardItem({
    Key key,
    @required this.title,
    @required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.wallet_giftcard_outlined,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
