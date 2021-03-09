import 'package:flutter/material.dart';

class ZeroBrokerCashIcon extends StatelessWidget {
  final double circle1Rad;
  final double circle2Rad;
  final double circle3Rad;
  final Function onTapIcon;
  const ZeroBrokerCashIcon({
    this.circle1Rad,
    this.circle2Rad,
    this.circle3Rad,
    @required this.onTapIcon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapIcon,
      child: CircleAvatar(
        radius: 12,
        backgroundColor: Colors.yellow[800],
        child: CircleAvatar(
          radius: 10.5,
          backgroundColor: Colors.yellow[200],
          child: CircleAvatar(
            radius: 9,
            child: Text(
              'Z',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.yellow[800],
          ),
        ),
      ),
    );
  }
}

class ZeroBrokerResizedCashIcon extends StatelessWidget {
  final double circle1Rad;
  final double circle2Rad;
  final double circle3Rad;

  const ZeroBrokerResizedCashIcon({
    @required this.circle1Rad,
    @required this.circle2Rad,
    @required this.circle3Rad,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: circle3Rad,
      backgroundColor: Colors.yellow[800],
      child: CircleAvatar(
        radius: circle2Rad,
        backgroundColor: Colors.yellow[200],
        child: CircleAvatar(
          radius: circle1Rad,
          child: Text(
            'Z',
            style: TextStyle(
              fontSize: 5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.yellow[800],
        ),
      ),
    );
  }
}
