import 'package:firebase_auth_getx/Constants/firebase_auth_constants.dart';
import 'package:firebase_auth_getx/Controllers/todo_controller.dart';
import 'package:firebase_auth_getx/datamodel/todo_model.dart';
import 'package:firebase_auth_getx/helper/firestore_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final contentTextEditorController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              authController.logout();
            },
            icon: const Icon(
              Icons.power_off_sharp,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Text(
              "Welcome user",
              style: Get.textTheme.headline3,
            ),
            TextField(
              controller: contentTextEditorController,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                final todoModel = TodoModel(
                  content: contentTextEditorController.text.trim(),
                  isDone: false,
                );
                await FirestoreDb.addTodo(todoModel);
                contentTextEditorController.clear();
              },
              child: const Text(
                "Add Todo",
              ),
            ),
            GetX<TodoController>(
              init: Get.put<TodoController>(TodoController()),
              builder: (TodoController todoController) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoController.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(todoController.todos[index].content);
                      // return Text(
                      //   todoController.todos[index].content,
                      // );

                      final _todoModel = todoController.todos[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  _todoModel.content,
                                  style: TextStyle(
                                    fontSize: Get.textTheme.headline6!.fontSize,
                                    decoration: _todoModel.isDone
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                  ),
                                ),
                              ),
                              Checkbox(
                                value: _todoModel.isDone,
                                onChanged: (status) {
                                  FirestoreDb.updateStatus(
                                    status!,
                                    _todoModel.documentId,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
