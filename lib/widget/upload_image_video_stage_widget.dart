import 'package:flutter/material.dart';

import 'custom_text_widget.dart';

class UploadItemWidget extends StatelessWidget {
  Widget icon;
  String name;
  Function onTap;

  UploadItemWidget({
    this.icon,
    this.name,
    this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              width: 20,
            ),
            CustomTextWidget(
              fontSize: 13,
              title: name,
            ),
          ],
        ),
      ),
    );
  }
}
