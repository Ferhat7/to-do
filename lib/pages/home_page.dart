import 'package:flutter/material.dart';
import 'package:to_do/widget/card_widget.dart';
import 'package:to_do/widget/empty_page.dart';
import 'package:to_do/widget/loading_widget.dart';
import 'package:to_do/widget/logoutwidget.dart';

import '../widget/error_widget.dart';
import '../widget/new_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var temp = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text("Home page"),
          actions: [


        LogoutWidgetPage(context),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),

          ],

          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),

        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            if (temp == 0)
              LogoutWidgetPage(context)
            else if (temp == 1)
              CardWidget(context)
            else if (temp == 2)
              ErrorPageWidget(context)
            else if (temp == 3)
              LoadingPageWidget(context)
            else
              NewPageWidget(context)
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: new Icon(Icons.radio_button_unchecked),
                        title:  TextField( decoration: InputDecoration(
                          labelText: "Task Name"
                        ),),
                      trailing:new Icon(Icons.send),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),

                    ],
                  );
                });
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}
