import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  //List<Task> tasks = [
  //  Task(name: 'Buy milk'),
  //  Task(name: 'Buy eggs'),
  //  Task(name: 'Buy bread'),
  //];

  @override
  Widget build(BuildContext context) {
    //return ListView(
    //children: <Widget>[
    //  TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone),
    //  TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone),
    //  TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone),
    //],
    //);
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
