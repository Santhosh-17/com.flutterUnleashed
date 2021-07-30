import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: 'Buy Books'),
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Clothes')
  ];

  int get taskCount{
    return tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);

    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleIsDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}