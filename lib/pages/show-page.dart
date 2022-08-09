import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do/services/task.dart';


class ShowPage extends StatefulWidget {


  const ShowPage

  ({super.key, this.uuid,this.title});

  final title;
  final uuid;


  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {


var collection = FirebaseFirestore.instance.collection('users');

var currentUser = FirebaseAuth.instance.currentUser;

final TextEditingController _controller = TextEditingController();


final TaskService _taskService = TaskService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,

        title: const Text("TO-DO"),


        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),


      body: Center(
        child: Form(

          child: Container(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                 //   controller: _title,


                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Task Name',

                    ),

                  ),

                ),

                Container(

                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(),

                      prefixIcon: Icon(Icons.calendar_month),
                      labelText: 'Date',

                    ),
                    onTap: () {


                      _selectDate(context);

                    },

                    controller: _controller,

                  ),

                ),


                Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: TextFormField(


                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(20),
                        ),
                        border: OutlineInputBorder(),
                          labelText:'Note',




                      ),
                      maxLines: 10,
                      minLines: 10,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0, bottom: 0 , right: 0, top: 400),
                  // margin: EdgeInsets.all(20),

                  height: 50,
                  width: double.infinity,
                  // margin: EdgeInsets.all(20),
                  //margin: EdgeInsets.fromLTRB(0, 400, 0, 0),

                  child: ElevatedButton(
                      child: const Text('SAVE'),

                      onPressed: () {




                      }),
                ),


              ],
            ),


          ),
        ),

      ),);
  }

  _selectDate(BuildContext context) async {
  final selected=  await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2050, 7),
      helpText: 'Select a date',
    );
    setState(() {
      _controller.text = selected.toString();
    });

}

}