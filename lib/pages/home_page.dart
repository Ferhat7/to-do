import 'package:flutter/material.dart';
import 'package:to_do/widget/card_widget.dart';
import 'package:to_do/widget/empty_page.dart';
import 'package:to_do/widget/loading_widget.dart';

import '../widget/error_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var temp = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding:  const EdgeInsets.all(10),
        children:  [
          if(temp == 0)
            EmptyPageWidget(context)
          else if(temp == 1)
            CardWidget(context)
          else if(temp==2)
            ErrorPageWidget(context)
        else
          LoadingPageWidget(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         setState(() {
           temp++;
         });
        },

        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
