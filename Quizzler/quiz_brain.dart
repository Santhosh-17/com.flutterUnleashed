import 'questions.dart';
class QuizBrain{
  int _queNo = 0;

  List<Questions> _questionBook = [
    Questions('The Captain of India Cricket Team is Virat Kohli',true),
    Questions('England won the series against India in 2021',false),
    Questions('Washington Sundar once again missed his maiden century',true),
    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions('Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  void nextQuestion(){
    if(_queNo < _questionBook.length - 1){
      _queNo ++;
    }

  }

  String getQuestionText( ){
    return _questionBook[_queNo].questionText;
  }

  bool getAnswer( ){
    return _questionBook[_queNo].questionAns;
  }

  bool isFinished(){
    if(_queNo >= _questionBook.length - 1){
      return true;
    }else{
      return false;
    }
  }


  void reset(){
    _queNo = 0;
  }

}