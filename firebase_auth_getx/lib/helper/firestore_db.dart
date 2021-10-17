import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_getx/Constants/firebase_auth_constants.dart';
import 'package:firebase_auth_getx/datamodel/todo_model.dart';

class FirestoreDb {
  static addUser(String email) async {
    await firebaseFirestore.collection('users').doc(auth.currentUser!.uid).set({
      'email': email,
      'createdOn': Timestamp.now(),
    });
  }

  static addTodo(TodoModel todomodel) async {
    await firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('todos')
        .add({
      'content': todomodel.content,
      'createdon': Timestamp.now(),
      'isDone': false,
    });
  }

  static Stream<List<TodoModel>> todoStream() {
    return firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('todos')
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> todos = [];
      for (var todo in query.docs) {
        final todoModel =
            TodoModel.fromDocumentSnapshot(documentSnapshot: todo);
        todos.add(todoModel);
      }
      return todos;
    });
  }

  static updateStatus(bool isDone, documentId) {
    firebaseFirestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('todos')
        .doc(documentId)
        .update(
      {
        'isDone': isDone,
      },
    );
  }
}
