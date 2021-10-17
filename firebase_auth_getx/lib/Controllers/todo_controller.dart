import 'package:firebase_auth_getx/datamodel/todo_model.dart';
import 'package:firebase_auth_getx/helper/firestore_db.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> todoList = Rx<List<TodoModel>>([]);
  List<TodoModel> get todos => todoList.value;

  @override
  void onReady() {
    todoList.bindStream(FirestoreDb.todoStream());
  }
}
