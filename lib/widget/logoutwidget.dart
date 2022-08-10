import 'package:flutter/material.dart';
import 'package:to_do/pages/login_page.dart';
import 'package:to_do/widget/comletedTask_widget.dart';
Widget LogoutWidgetPage(BuildContext context) {
  return PopupMenuButton(

      itemBuilder: (BuildContext context) =>
      <PopupMenuEntry>[
        PopupMenuItem(
          child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User'),
          ),
        ),


        PopupMenuItem(
          child: ListTile(
            leading: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  showDialog
                    (context: context,
                      builder: (BuildContext context) =>
                          AlertDialog(
                            content: Text('Are u sure'),
                            actions: [
                              TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              }, child: Text('OK')),
                              TextButton(onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('CANCEL')),
                            ],
                          ));
                }
            ),


            title: Text('logout'),

          ),
        ),
        PopupMenuItem(
          child: TextButton.icon(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CompletedTask_Widget(context);
                  });
            },
            icon: Icon(
              Icons.edit,
              size: 24.0,
              color: Colors.black,
            ),
            label: Text(
              "Completed Tasks",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),


      ]);
}
