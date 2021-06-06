import 'package:bmi_calculator/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  BottomButton({this.buttonTitle,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle,style: kLargeButtonTextStyle,),
        color: kBottomContainerColor,
        padding: EdgeInsets.only(bottom: 18.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
