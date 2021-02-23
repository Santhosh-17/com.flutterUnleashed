import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
   home: Scaffold(
     backgroundColor: Colors.blue[50],
     appBar: AppBar(
       title: Text('Ask My Anything!'),
       backgroundColor: Colors.blue[800],
     ),
     body: MagicBall(),
   ),
  ),
  );
}

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child:FlatButton(
            onPressed: () {
              changeImage();
            },
            child: Image.asset('images/ball$ballNumber.png',
            ),
        ),
      ),
    );
  }

  changeImage(){
    setState(() {
      ballNumber = Random().nextInt(5)+1;
      print(ballNumber);
    });
  }

}

