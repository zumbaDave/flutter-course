import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  // make tasks private so that we do not think adding directly to it
  //  from the add task screen will update the ui without calling notify
  //     listeners, which is only done in the addTask method of this class
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  // following make it so tht _tasks can be modified outside this class
  // we don't want that
  //List<Task> get tasks {
  //  return _tasks;
  //}

  // following will return _tasks, but cannot be modified from outside class
  // need to import from dart collections to have access to
  //   unmodifiableListView
  // it's a view of another list(not a ui view)
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    // update listeners that a task was added
    // if we don't notify listeners, then when adding a task, it will not show
    //   up in list of UI
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
