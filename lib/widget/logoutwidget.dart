import 'package:flutter/material.dart';
import 'package:to_do/pages/home_page.dart';
import 'package:to_do/widget/delet_updat_widget.dart';
Widget LogoutWidgetPage(BuildContext context) {


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
    const PopupMenuItem(
      child: ListTile(
        leading: Icon(Icons.logout),
        title: Text('logout'),
  ),
  ),

  

      
    



  ]);



}
