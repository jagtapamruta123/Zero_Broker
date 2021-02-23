import 'package:flutter/material.dart';

class CustomTabBarTitle extends StatelessWidget {
  String tab1Name;
  String tab2Name;
  String tab3Name;
  String tab4Name;

  CustomTabBarTitle({
    this.tab1Name,
    this.tab2Name,
    this.tab3Name,
    this.tab4Name,
    Key key,
    this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      controller: tabController,
      tabs: [
        Tab(
          text: tab1Name,
        ),
        Tab(
          text: tab2Name,
        ),
        Tab(
          //text: 'Buy Now',
          text: tab3Name,
        ),
        // Tab(
        //   //text: 'Buy Now',
        //   text: tab4Name,
        // ),
      ],
    );
  }
}

class TabSearchBarWidget extends StatelessWidget {
  String hintText;
  Function function;
  Icon iconSearch;
  Widget iconSuffix;
  TabSearchBarWidget({
    @required this.hintText,
    @required this.function,
    this.iconSearch,
    this.iconSuffix,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      child: Container(
        height: 48,
        child: TextField(
          readOnly: true,
          onTap: function,
          showCursor: false,
          enableInteractiveSelection: false,
          style: TextStyle(
            fontSize: 5,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: iconSearch,
            suffixIcon: iconSuffix,
            // Icon(
            //   Icons.search,
            //   color: Colors.grey,
            //   size: 20,
            // ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

//TabView Card Text with icons
class CardTextWidget extends StatelessWidget {
  String line;
  CardTextWidget({
    @required this.line,
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
        Text(
          line,
          style: TextStyle(
            fontSize: 9,
            letterSpacing: 0.2,
          ),
        )
      ],
    );
  }
}

class TabViewSecondCardItem extends StatelessWidget {
  Widget icon;
  String title;
  Function onTap;
  String hoverMsg;
  TabViewSecondCardItem({
    this.hoverMsg,
    @required this.icon,
    @required this.title,
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                hoverMsg,
                style: TextStyle(fontSize: 8),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: icon,
          ),
          SizedBox(
            height: 1,
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
    );
  }
}

class TabBarSecondCardWidget extends StatelessWidget {
  final Function onTapPayRent;
  const TabBarSecondCardWidget({
    @required this.onTapPayRent,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabViewSecondCardItem(
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.car_rental,
                    size: 40,
                  ),
                  title: 'movers n packers',
                  onTap: null,
                ),
                VerticalDivider(),
                SizedBox(
                  width: 19,
                ),
                TabViewSecondCardItem(
                  onTap: onTapPayRent,
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.home_outlined,
                    size: 40,
                  ),
                  title: 'Pay Rent',
                ),
                SizedBox(
                  width: 18,
                ),
                VerticalDivider(),
                TabViewSecondCardItem(
                  onTap: null,
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.car_rental,
                    size: 40,
                  ),
                  title: 'Rental Agreement',
                ),
              ],
            ),
          ),
        ),
        Divider(),
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabViewSecondCardItem(
                  onTap: null,
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.car_rental,
                    size: 40,
                  ),
                  title: 'Click n Earn',
                ),
                SizedBox(
                  width: 25,
                ),
                VerticalDivider(),
                SizedBox(
                  width: 19,
                ),
                TabViewSecondCardItem(
                  onTap: null,
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.home_outlined,
                    size: 40,
                  ),
                  title: 'Home Services',
                ),
                SizedBox(
                  width: 8,
                ),
                VerticalDivider(),
                SizedBox(
                  width: 8,
                ),
                TabViewSecondCardItem(
                  onTap: null,
                  hoverMsg: 'lowest price',
                  icon: Icon(
                    Icons.car_rental,
                    size: 40,
                  ),
                  title: 'For NRI\'s',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// class TabBarSecondCardLine extends StatelessWidget {

//   const TabBarSecondCardLine({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: IntrinsicHeight(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TabViewSecondCardItem(
//               hoverMsg: 'lowest price',
//               icon: Icon(
//                 Icons.car_rental,
//                 size: 40,
//               ),
//               title: 'movers n packers',
//             ),
//             VerticalDivider(),
//             SizedBox(
//               width: 19,
//             ),
//             TabViewSecondCardItem(
//               hoverMsg: 'lowest price',
//               icon: Icon(
//                 Icons.home_outlined,
//                 size: 40,
//               ),
//               title: 'movers n packers',
//             ),
//             SizedBox(
//               width: 18,
//             ),
//             VerticalDivider(),
//             TabViewSecondCardItem(
//               hoverMsg: 'lowest price',
//               icon: Icon(
//                 Icons.car_rental,
//                 size: 40,
//               ),
//               title: 'movers n packers',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
