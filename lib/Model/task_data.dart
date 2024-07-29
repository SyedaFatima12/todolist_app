import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
   final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy Egg'),
    Task(name: 'Buy bread'),
    //Task(name: 'Go to the gym'),
  ];

  int get listCount {
    return _tasks.length;
  }
  UnmodifiableListView get tasks{
    return UnmodifiableListView(_tasks);

  }

  void addTask({required String name}){
   Task newTask= Task(name: name);
    _tasks.add(newTask);
    //ChangeNotifier;
    notifyListeners();
  }
  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}
