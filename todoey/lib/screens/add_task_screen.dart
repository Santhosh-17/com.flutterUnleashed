import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modals/task_data.dart';
class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 70.0,vertical: 20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Text('Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.w400
              ),),
            ),
            Flexible(child: TextField(
              onChanged: (newValue){
                newTaskTitle = newValue;
              },
              textAlign: TextAlign.center,
              autofocus: true,
              cursorColor: Colors.lightBlueAccent,)),
            SizedBox(height: 20.0,),
            Flexible(
              child: MaterialButton(
                onPressed: (){
                  Provider.of<TaskData>(context,listen: false).addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text('Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.0
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
