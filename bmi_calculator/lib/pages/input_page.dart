import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/resuable_card.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/utils/constants.dart';

enum GenderType{
  MALE,
  FEMALE
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      color: selectedGender == GenderType.MALE ? kActiveCardColor : kInactiveCardColor , cardChild: IconContent(FontAwesomeIcons.mars,'MALE'), onPress: (){
                    setState(() {
                      selectedGender = GenderType.MALE;
                    });
                  },
              ),
              ),
              Expanded(
                  child: ReusableCard(
                     color: selectedGender == GenderType.FEMALE ? kActiveCardColor : kInactiveCardColor,  cardChild: IconContent(FontAwesomeIcons.venus,'FEMALE'), onPress: (){
                    setState(() {
                      selectedGender = GenderType.FEMALE;
                    });
                  },
              ),
              )
            ],
          ),
          ),
          Expanded(
              child: ReusableCard(
                  color: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('HEIGHT',style: kTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),style: kNumberTextStyle,),
                          SizedBox(width: 2.0,),
                          Text('cm',style: kTextStyle,)
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                        ),
                        child: Slider(value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                      )
                    ],
                  )
              ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                  child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',style: kTextStyle,),
                          Text(weight.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPressed: (){
                                  setState(() {
                                    weight = weight - 1;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: (){
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
              ),
              ),
              Expanded(
                  child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: kTextStyle,),
                          Text(age.toString(),style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus),
                                onPressed: (){
                                  setState(() {
                                    age = age - 1;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus),
                                onPressed: (){
                                  setState(() {
                                    age = age + 1;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
              ),
              )
            ],
          ),
          ),
          BottomButton(buttonTitle: 'CALCULATE',onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
              bmiValue: calc.calculateBMI(),
              bmiResult: calc.getResult(),
              bmiInterpretation: calc.getInterpretation(),
            )) );
          },)
        ],
      ),
    );
  }
}