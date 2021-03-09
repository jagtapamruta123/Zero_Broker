import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  // final Color color;

  const NavigationButtonWidget({
    @required this.title,
    @required this.onTap,
    // this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Center(
          child: Text(
            title,
          ),
        ),
        width: double.infinity,
      ),
    );
  }
}
