import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/services/task.dart';
import 'package:to_do/widget/card_widget.dart';
import 'package:to_do/widget/empty_page.dart';
import 'package:to_do/widget/loading_widget.dart';
import 'package:to_do/widget/logoutwidget.dart';

import '../services/auth.dart';
import '../widget/error_widget.dart';
import '../widget/new_widget.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController _title=TextEditingController();



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







        body: ListView(
          padding:  const EdgeInsets.all(10),
          children:  [


              CardWidget(context),


          ],
        ),

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
                          var  createTime=DateTime.now();
                          TaskService().createTask(_title.text, createTime.toString());
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
