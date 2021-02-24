import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XyloPhoneApp());
}

class XyloPhoneApp extends StatelessWidget {

  Expanded createWidget(Color c,int file){

    return Expanded(
        child: FlatButton(
        onPressed: (){
          final player = AudioCache();
          player.play('note$file.wav');
          },
          color: c, child: null,
        ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[800],
          title: Center(child: Text('XyloPhone',
          style: TextStyle(
            fontSize: 18,
          ),)),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              createWidget(Colors.red,1),
              createWidget(Colors.orange,2),
              createWidget(Colors.yellow,3),
              createWidget(Colors.green,4),
              createWidget(Colors.teal,5),
              createWidget(Colors.blue,6),
              createWidget(Colors.purple,7),
            ],
          ),
        ),
      ),
    );
  }
}
