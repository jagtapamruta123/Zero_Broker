import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  String title;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  CustomTextWidget({
    this.color,
    this.title,
    this.fontSize,
    this.fontWeight,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
