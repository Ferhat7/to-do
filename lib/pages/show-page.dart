import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/services/task.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({super.key, this.uuid, this.title});

  final title;
  final uuid;

  @override
  _ShowPageState createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  var collection = FirebaseFirestore.instance.collection('users');
  var currentUser = FirebaseAuth.instance.currentUser;

  final TextEditingController updateTimeController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  late DateTime? updateTime;
  late String content;
  late String title;

  @override
  void initState() {
    updateTime = DateTime.now();
    content = "";
    title = "";
    super.initState();
  }

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
        body: FutureBuilder<DocumentSnapshot>(
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
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              title = data['title'] ?? '';
              updateTime = DateTime.parse(
                  data['update time'] ?? DateTime.now().toString());
              content = data['content'] ?? '';

              titleController.text = title;
              updateTimeController.text =
                  DateFormat.yMMMd().format(updateTime!);
              contentController.text = content;

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
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Task Name',
                                  ),
                                  onChanged: (value) {
                                    title = value;
                                  },
                                  onSaved: (value) {
                                    title = value ?? "";
                                  },
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
                                  controller: updateTimeController,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: TextFormField(
                                    controller: contentController,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(20),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(20),
                                      ),
                                      border: OutlineInputBorder(),
                                      labelText: 'Note',
                                    ),
                                    maxLines: 10,
                                    minLines: 10,
                                    onChanged: (value) {
                                      // setState(() {
                                      content = value;
                                      // contentController.text = content;
                                      // });
                                    },
                                    onSaved: (value) => {
                                      setState(() {
                                        content = value ?? "";
                                        // contentController.text = content;
                                      })
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 0, bottom: 0, right: 0, top: 400),
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: const Text('SAVE'),
                                  onPressed: () {
                                    TaskService()
                                        .updateTask(
                                            widget.uuid.toString(),
                                            title,
                                            content,
                                            updateTime.toString())
                                        .then((value) {
                                      return Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                            ]),
                      ),
                    ),
                  )
                ],
              );
            }

            return const Text("");
          },
        ));
  }

  _selectDate(BuildContext context) async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: updateTime ?? DateTime.now(),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2050, 7),
      helpText: 'Select a date',
    );
    updateTime = selected!;
    updateTimeController.text = DateFormat.yMMMd().format(updateTime!);
  }
}
