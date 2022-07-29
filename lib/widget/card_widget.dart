
 import 'package:flutter/material.dart';

Widget CardWidget(BuildContext context){

  return
    const Card(
      semanticContainer: false,
      elevation: 10,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Icon(Icons.check_circle_outline_rounded),
        title: Text("Task Title"),
        trailing: Icon(Icons.more_vert),
      ),
    );


}