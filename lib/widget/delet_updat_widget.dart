import 'package:flutter/material.dart';

Widget DeletUpdatePageWidget(BuildContext context){
  return PopupMenuButton(
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),

        const PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),



      ]);



}