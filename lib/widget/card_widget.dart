
 import 'package:flutter/material.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/widget/delet_updat_widget.dart';

Widget CardWidget(BuildContext context){

  return
     Card(
      semanticContainer: false,
      elevation: 10,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: Icon(Icons.check_circle_outline_rounded),
        title: Text("Task Title"),
        trailing: DeletUpdatePageWidget(context)






    ));


}