import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  Icon icon;
  Function function;
  String title;
  DrawerWidget({
    this.icon,
    this.function,
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: function,
    );
  }
}
