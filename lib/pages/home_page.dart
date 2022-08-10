import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/services/task.dart';
import 'package:to_do/widget/comletedTask_widget.dart';
import 'package:to_do/widget/empty_page.dart';
import 'package:to_do/widget/loading_widget.dart';
import 'package:to_do/widget/logoutwidget.dart';
import 'package:to_do/widget/tasklist_widget.dart';
import '../widget/error_widget.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController _title=TextEditingController();
var currentUser = FirebaseAuth.instance.currentUser;


CollectionReference usersCollection =
FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,

          title: const Text("Home page"),
          actions: <Widget>[
        LogoutWidgetPage(context),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),

          ],

          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),







        body: StreamBuilder<QuerySnapshot>(
            stream: usersCollection.doc(currentUser?.uid).collection('tasks').where('status',isEqualTo: 1).snapshots(),
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

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: new Icon(Icons.radio_button_unchecked),
                        title:  TextFormField
                          (
                        controller:_title,
                        decoration: InputDecoration(

                          labelText: "Task Name"
                        ),),
                      trailing:new Icon(Icons.send),
                        onTap: () {
                          TaskService().createTask(_title.text);
                          Navigator.pop(context);

                        },
                      ),

                    ],

                  );


                }


                );

          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
  }
