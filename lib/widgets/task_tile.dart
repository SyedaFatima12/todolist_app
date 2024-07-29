import 'package:flutter/material.dart';
import 'package:todo_list/Model/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {super.key,
      required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback, required this.deleteTaskCallback, });

  // final bool isChecked = false;
  final bool isChecked;

  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final void Function() deleteTaskCallback;

  @override
  Widget build(BuildContext context) {
    //print('isChecked: $isChecked');
    return ListTile(
      onLongPress:deleteTaskCallback ,
        leading: Text(taskTitle,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            )),
        trailing: Checkbox(
            value: isChecked,
            activeColor: Colors.lightBlueAccent,
            onChanged: checkboxCallback));
  }
}

//  (bool? checkboxState) {
//               setState(() {
//                 isChecked = checkboxState!;
//                 print(checkboxState);
//               });

// return ListTile(
//         leading: Text('Task',
//             style: TextStyle(
//               decoration: isChecked ? TextDecoration.lineThrough : null,
//             )),
//         trailing: BuildCheckBox(
//           check: isChecked,
//           function: (bool? checkboxState) {
//             setState(() {
//               isChecked = checkboxState!;
//               print(checkboxState);
//             });
//           },
//         ));
//   }
// }

//class BuildCheckBox extends StatelessWidget {
//   const BuildCheckBox({super.key, required this.check, required this.function});
//
//   final bool check;
//   final Function(bool?) function;
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//         value: check, activeColor: Colors.lightBlueAccent, onChanged: function);
//   }
// }
