
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
      'update_time':updateTime
    });
  }

  updateNote(String content, String uuid,String updateTime) async {
    await task
        .doc(uuid)
        .update(
        {

          'content': content,
          'update time':updateTime
        }).then((value) => null);
    return null;

  }

  deleteTask(String uuid) async {
    await task.doc(uuid)
        .delete();
    return null;
  }
  updateTaskTitle(String title, String uuid) async {
  }

  getTasks(String uuid) async{

    return task.doc(uuid).get();
    // return null;
  }
}

