import 'package:bmi_calculator/pages/input_page.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/resuable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  final String bmiValue;
  final String bmiResult;
  final String bmiInterpretation;

  ResultsPage({@required this.bmiValue,@required this.bmiResult,@required  this.bmiInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',style: kTitleTextStyle,)),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmiResult.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiValue,style: kBMITextStyle,),
                  Text(bmiInterpretation,
                    style: kResultBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0,
              child:BottomButton(buttonTitle: 'RE - CALCULATE',onTap: (){
                Navigator.pop(context);
              },),
          )
        ],
      ),
    );
  }
}
