import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red[500],
      appBar: AppBar(
        title: Text('Dicee'),
        backgroundColor: Colors.red[600],
      ),
      body: DicePage(),
    ),
  ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 1;
  int rightDiceNumber = 2;


  @override
  Widget build(BuildContext context){

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          //--------------------
          // SizedBox(
          //   height: double.infinity,
          //   width: 10.0,
          // ),
          //--------------------

          Expanded(
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              //  print('Left Button got pressed! and its $leftDiceNumber');
              },
              child: Image.asset('images/dice$leftDiceNumber.png'
              ),
            ),
          ),

          //--------------------
          // SizedBox(
          //   width: 25.0,
          // ),
          //--------------------

          Expanded(
            child:FlatButton(
              onPressed: () {
               changeDiceFace();
               // print('Right Button got pressed! and its $rightDiceNumber');
              },
              child: Image.asset('images/dice$rightDiceNumber.png',
              ),
            ),
          ),

          //--------------------
          // SizedBox(
          //   height: double.infinity,
          //   width: 10.0,
          // )
          //--------------------

        ],
      ),
    );

  }

  void changeDiceFace(){
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

}
