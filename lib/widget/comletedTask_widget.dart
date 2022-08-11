import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widget/emptyTask_widget.dart';
import 'package:to_do/widget/errorTask_widget.dart';
import 'package:to_do/widget/loadingTask_widget.dart';

import 'listTask_widget.dart';

Widget CompletedTask_Widget(BuildContext context) {var currentUser = FirebaseAuth.instance.currentUser;


CollectionReference usersCollection =
FirebaseFirestore.instance.collection('users');
  return Scaffold(


    body: StreamBuilder<QuerySnapshot>(
        stream: usersCollection.doc(currentUser?.uid).collection('tasks').where('status',isEqualTo: 0).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Error_Widget(context);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading_Widget(context);
          }
          if (snapshot.data!.docs.isEmpty) {
            return Empty_Widget(context);
          }

          return TaskListWidget(context,snapshot);


        }),





  );





}