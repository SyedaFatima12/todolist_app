import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Model/task_data.dart';
import 'package:todo_list/widgets/tasklist.dart';
import 'Model/task.dart';

//In Flutter, "state" refers to the data that defines the UI of an application
// at any given moment. This data can change over time due to user interaction,
// network responses, or other factors. Managing state effectively is crucial for
// creating responsive and dynamic user interfaces.

class HomePage extends StatelessWidget {
  final myController = TextEditingController();

  HomePage({super.key});

  // List<Task> tasks = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Container(
                      color: const Color(0xff757575),
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Add Task',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            TextField(
                              autofocus: true,
                              textAlign: TextAlign.center,
                              controller: myController,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                ),
                                onPressed: () {
                                  Provider.of<TaskData>(context,listen: false)
                                      .addTask(name: myController.text);

                                  Navigator.pop(context);
                                 // myController.clear();
                                  print('hello');

                                  // Task newTask = Task(name: myController.text);

                                  // tasks.clear();
                                  //  setState(() {
                                  //    tasks.add(newTask);
                                  //  });
                                },
                                child: const Text('Add')),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.only(
                  top: 60, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        color: Colors.lightBlueAccent,
                        size: 30.0,
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 50.0),
                  ),
                  Text(
                    //'${tasks.length} Tasks',
                    //'${Provider.of<TaskData>(context).tasks.length} Tasks',
                    '${Provider.of<TaskData>(context).listCount} Tasks',
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ],
              )),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: const ListTask(
                  //task: tasks,

                  ),
            ),
          )
        ],
      ),
    );
  }
}
