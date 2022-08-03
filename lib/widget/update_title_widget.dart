

import 'package:flutter/material.dart';
import 'package:to_do/services/task.dart';
 Widget UpdateTitleWidget(BuildContext context,String uuid){

  final  TextEditingController _title=TextEditingController();

     return  AlertDialog(
      content:
        TextFormField(
      controller: _title,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Enter new title'),
      ),



          actions: [
            TextButton(
                onPressed: () {
                  TaskService()
                      .editTaskTitle(_title.text, uuid)
                      .then((value) => Navigator.pop(context));
                },
                child: const Text('OK')),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
            ),
          ],);




 }



