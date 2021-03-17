import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  Function onPressFlatButton;
  final String buttonTitle;
  final Color color;
  final double minWidth;
  FlatButtonWidget({
    @required this.onPressFlatButton,
    @required this.buttonTitle,
    this.color,
    this.minWidth,
    Key key,
    this.isCreditInfoAccepted = false,
  }) : super(key: key);

  final bool isCreditInfoAccepted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        minWidth: minWidth,
        color: color,

        //isCreditInfoAccepted ? Colors.pink : Colors.pink[100],
        // splashColor: Colors.pink,
        onPressed: onPressFlatButton,
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 10,
            letterSpacing: 0.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
