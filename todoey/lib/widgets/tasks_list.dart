import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/modals/task_data.dart';
import 'package:todoey/widgets/task_tile.dart';
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (context, taskData, child){
          return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder:(context,index){
              final task = taskData.tasks[index];
              return TaskTile(
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkBoxCallback: (checkBoxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: (){
                    taskData.deleteTask(task);
                  }
              );
            },
          );
        });
  }
}