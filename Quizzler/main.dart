import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('Quizzler',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0
            ),
            ),
          ),

        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'The Captain of India Cricket Team is Virat Kohli',
    'England won the series against India in 2021',
    'Washington Sundar once again missed his maiden century',
  ];
  List<bool> ans = [true,false,true];
  int queNo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 7,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  questions[queNo],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
            ),
          ),
        ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            child: FlatButton(
              onPressed: (){

                if(ans[queNo] == true){
                  setState(() {
                    queNo++;
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    );
                  });
                }else{
                  setState(() {
                    queNo++;
                    scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                    );
                  });
                }

              },
              child: Text('True',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white
              ),
              ),
              color: Colors.green,
              textColor: Colors.white,
            ),
          ),
        ),

        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 30.0),
            child: FlatButton(
              onPressed: (){
                
                if(ans[queNo]==false){
                  setState(() {
                    queNo++;
                    scoreKeeper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        )
                    );
                  });
                }else{
                  setState(() {
                    queNo++;
                    scoreKeeper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                    );
                  });
                }

              },
              child: Text('False',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),
              ),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
