import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  final Function onPressFlatButton;
  final String buttonTitle;
  final Color color;
  const FlatButtonWidget({
    @required this.onPressFlatButton,
    @required this.buttonTitle,
    this.color,
    Key key,
    this.isCreditInfoAccepted = false,
  }) : super(key: key);

  final bool isCreditInfoAccepted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
        minWidth: double.infinity,
        color: color,
        //isCreditInfoAccepted ? Colors.pink : Colors.pink[100],
        // splashColor: Colors.pink,
        onPressed: onPressFlatButton,
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
