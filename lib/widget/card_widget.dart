
 import 'package:flutter/material.dart';
import 'package:to_do/pages/show_page.dart';
import 'package:to_do/services/task.dart';
import 'package:to_do/widget/deletUpdatTask_widget.dart';


Widget CardWidget(BuildContext context,String title,String uuid){


  return InkWell(
      child: Card(
          semanticContainer: false,
          elevation: 10,
          borderOnForeground: false,
          clipBehavior: Clip.antiAlias,
          child:
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.check_circle_outline_rounded), onPressed: () {
                TaskService().completedTask(uuid);}

            ),
            title: Text(title),
            trailing: UpdateDeleteWidget(context, uuid),


          )),


      onTap: () =>
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ShowPage(title: title, uuid: uuid,))));
}

