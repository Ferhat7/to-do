
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';



class TaskService {



  var  task= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection(
      'tasks');
  var uuid = Uuid().v1();

   createTask(String title,String updateTime) async {


    await task
        .doc(uuid).set({
      'uid': uuid,
      'title': title,

    });
  }

   Future<TaskService?>updateTask(String content,String updateTime,String uuid,String title) async {
    await task
        .doc(uuid)
        .update(
        {
          'content': content,
          'update time':updateTime,
          'title':title,
        }).then((value) => null);


  }

  deleteTask(String uuid) async {
    await task.doc(uuid)
        .delete();
    return null;
  }
  editTaskTitle(String title, String uuid) async {
    await task
        .doc(uuid)
        .update(
        {

          'title': title,

        }).then((value) => null);
    return null;

  }

  Future<DocumentSnapshot>getTasks(String uuid) async{

    return task.doc(uuid).get();
    // return null;
  }
}

