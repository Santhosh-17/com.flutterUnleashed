class Task{
  String name;
  bool isDone;
  Task({this.name,this.isDone=false});
  void toggleIsDone(){
    isDone = !isDone;
  }
}