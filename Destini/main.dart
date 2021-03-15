import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  QuizBrain quizBrain = QuizBrain();

  void checkAnswers(bool userSelectedAns){
    bool crtAns = quizBrain.getAnswer();

    setState(() {

      bool isFinish = quizBrain.isFinished();
      if(isFinish){
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizBrain.reset();
        scoreKeeper = [];

      }else{
        if(userSelectedAns == crtAns){
          scoreKeeper.add(Icon(Icons.check, color: Colors.green));

        }else{
          scoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }
        quizBrain.nextQuestion();

      }

    });


  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
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
                checkAnswers(true);
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
                checkAnswers(false);
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
