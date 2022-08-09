import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/services/task.dart';


class ShowPage extends StatefulWidget {


  const ShowPage({super.key, this.uuid,this.title});

  final title;
  final uuid;


  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
var collection = FirebaseFirestore.instance.collection('users');
var currentUser = FirebaseAuth.instance.currentUser;

final TextEditingController _updateTime = TextEditingController();
final TextEditingController _content = TextEditingController();
final TextEditingController _title = TextEditingController();

final String updateTime="";
final String content="";
final String title="";

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


      body:FutureBuilder<DocumentSnapshot>(
        future: TaskService().getTasks(widget.uuid),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            _content.text= data['content'] ?? '';
            _title.text=data['title']??'';
               _updateTime.text=data['update time']??'';
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Form(
                    child: SizedBox(
                      width: 400,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextFormField(
                                controller: _title,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Task Name',

                                ),

                              ),

                            ),

                            Container(

                              margin: const EdgeInsets.all(10),
                              child: TextFormField(

                                decoration: const InputDecoration(

                                  border: OutlineInputBorder(),

                                  prefixIcon: Icon(Icons.calendar_month),
                                  labelText: 'Date',

                                ),
                                onTap: () {
                                  _selectDate(context);
                                },

                                controller: _updateTime,
                              ),

                            ),


                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: TextFormField(

                                  controller:_content ,
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
                              margin: const EdgeInsets.only(left: 0, bottom: 0 , right: 0, top: 400),
                              // margin: EdgeInsets.all(20),

                              height: 50,
                              width: double.infinity,
                              // margin: EdgeInsets.all(20),
                              //margin: EdgeInsets.fromLTRB(0, 400, 0, 0),

                              child: ElevatedButton(
                                  child: const Text('SAVE'),

                                  onPressed: () {
                                    TaskService()
                                        .updateTask(_content.text,_updateTime.text,widget.uuid.toString(),_title.text)
                                        .then((value) {
                                      return Navigator.pop(context);
                                    });


                                  }),

                            ),


                          ]

                      ),


                    ),

                  ),


                )
              ],
            );
          }

          return const Text("loading");
        },
      )
      );

  }


  _selectDate(BuildContext context) async {
    DateTime? selected=  await showDatePicker(
      context: context,
      initialDate:DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2050, 7),
      helpText: 'Select a date',


    );



    setState(() {
     var time=DateFormat.yMMMd().format(selected!);
_updateTime.text=time.toString();

    });

}

}