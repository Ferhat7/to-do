
import'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uuid/uuid.dart';


  
class TaskService {



  var  task= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection(
      'tasks');
  var  taskData= FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).collection(
      'tasks').where('status',isEqualTo: "1");
  var uuid = Uuid().v1();

   createTask(String title) async {


    await task
        .doc(uuid).set({
      'uid': uuid,
      'title': title,
'status':1
    });
  }

   Future<TaskService?>updateTask(String uuid, String title, String content,String updateTime,) async {
    await task
        .doc(uuid)
        .update(
        {
          'content': content,
          'update time':updateTime,
          'title':title,
        }).then((value) => null);


  }
  Future<TaskService?>completedTask(String uuid) async {
    await task
        .doc(uuid)
        .update(
        {
         'status':0
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

