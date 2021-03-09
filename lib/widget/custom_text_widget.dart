import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String title;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  TextDecoration decoration;
  CustomTextWidget({
    this.color,
    this.title,
    this.fontSize,
    this.decoration,
    this.fontWeight,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
      ),
    );
  }
}
