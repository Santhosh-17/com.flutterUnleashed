import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modals/task.dart';
import 'package:todoey/modals/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen() );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60.0,bottom: 30.0,left: 30.0,right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Todoey',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700
                ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${Provider.of<TaskData>(context).taskCount} tasks',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0))
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}

