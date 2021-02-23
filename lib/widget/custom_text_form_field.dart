import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String label;
  Icon icon;

  CustomTextFormField({
    @required this.label,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: TextFormField(
        // maxLength: 1,
        //cursorColor: Colors.white,
        decoration: InputDecoration(
            prefixIcon: icon,
            //fillColor: Colors.black.withOpacity(0.2),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                style: BorderStyle.solid,
                width: 0.5,
              ),
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 10,
            )),
      ),
    );
  }
}
