import 'package:flutter/material.dart';
import 'package:to_do/services/task.dart';
import 'package:to_do/widget/updateTitleTask_widget.dart';

Widget UpdateDeleteWidget(BuildContext context, String uuid) {
  return PopupMenuButton(
    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
      PopupMenuItem(
        child: TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return UpdateTitleWidget(context, uuid);
                });
          },
          icon: Icon(
            Icons.edit,
            size: 24.0,
            color: Colors.black,
          ),
          label: Text(
            "Edit",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      PopupMenuItem(
          child: TextButton.icon(
        onPressed: () {
          TaskService().deleteTask(uuid);
        },
        icon: Icon(
          Icons.delete,
          size: 24.0,
          color: Colors.black,
        ),
        label: Text('Delete', style: TextStyle(color: Colors.black)),
      ))
    ],
  );
}
