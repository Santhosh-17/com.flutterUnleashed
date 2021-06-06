import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class IconContent extends StatelessWidget {
  final IconData iconData;
  final String tag;
  IconContent(this.iconData,this.tag);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
            iconData,
            size: 80.0
        ),
        SizedBox(height: 15.0,),
        Text(tag,style: kTextStyle,)
      ],
    );
  }
}