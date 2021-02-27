import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget {
  final String title;
  const NavigationButtonWidget({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.blue),
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
