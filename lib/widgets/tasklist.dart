import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Model/task_data.dart';
import 'package:todo_list/widgets/task_tile.dart';

import '../Model/task.dart';

class ListTask extends StatelessWidget {
  const ListTask({super.key});


 // final List<Task> task;
 //
 //  const ListTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
       return ListView.builder(
          itemBuilder: (context, index) {
            print(index);
            return TaskTile(

              // taskTitle: widget.task[index].name,
              // isChecked: widget.task[index].isDone,
              // taskTitle: Provider.of<TaskData>(context).tasks[index].name,
              // isChecked:Provider.of<TaskData>(context).tasks[index].isDone,
              taskTitle:taskData.tasks[index].name,
              isChecked:taskData.tasks[index].isDone,
              checkboxCallback: (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
                //  setState(() {
                //    widget.task[index].toggleDone();
                //
                // //  print(tasks[index].toggleDone());
                //  });
              }, deleteTaskCallback: () {
                taskData.deleteTask(taskData.tasks[index]);

            },
            );
          },
          itemCount: taskData.listCount,
        );
      },
    );
  }
}

// return ListView(
//   children: [
//     TaskTile(
//       taskTitle: tasks[0].name.toString(),
//       isChecked: tasks[0].isDone,
//     ),
//     TaskTile(
//       taskTitle: tasks[1].name.toString(),
//       isChecked: tasks[1].isDone,
//     ),
//     TaskTile(
//       taskTitle: tasks[2].name.toString(),
//       isChecked: tasks[2].isDone,
//     ),
//   ],
// );