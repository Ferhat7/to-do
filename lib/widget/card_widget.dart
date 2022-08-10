
 import 'package:flutter/material.dart';
import 'package:to_do/pages/show-page.dart';
import 'package:to_do/widget/delet_updat_widget.dart';
import 'package:to_do/widget/tasklist_widget.dart';

Widget CardWidget(BuildContext context,String title,String uuid){

  return InkWell(
      child:Card(
      semanticContainer: false,
      elevation: 10,
      borderOnForeground: false,
      clipBehavior: Clip.antiAlias,
      child:
      ListTile(
        leading: Icon(Icons.check_circle_outline_rounded),
        title: Text(title),
        trailing: UpdateDeleteWidget(context,uuid),






    )),



      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPage(title:title,uuid: uuid,))));



}
