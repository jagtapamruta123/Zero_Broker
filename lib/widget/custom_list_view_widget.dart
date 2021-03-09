import 'package:demo/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ListViewCustomWidget extends StatelessWidget {
  final int length;
  final String title;
  final String subTitle;
  final Widget leading;
  final Widget tailing;
  final Function onItemClick;

  const ListViewCustomWidget({
    this.title,
    this.subTitle,
    this.leading,
    this.length,
    this.tailing,
    this.onItemClick,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int count) {
        return GestureDetector(
          onTap: onItemClick,
          child: ListTile(
            title: CustomTextWidget(
              title: title,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            subtitle: Column(
              children: [
                CustomTextWidget(
                  title: subTitle,
                  fontSize: 12,
                ),
                Divider()
              ],
            ),
            trailing: tailing,
            leading: leading,
          ),
        );
      },
    );
  }
}
