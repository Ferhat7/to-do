import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widget/card_widget.dart';


Widget TaskListWidget(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
  var count=3;
  if(MediaQuery.of(context).size.width<700){
    count=2;
  }
  return ListView(
    padding: EdgeInsets.all(20),

    children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data =
      document.data()! as Map<String, dynamic>;
      var title =data['title'];
      var uuid=data['uid'];

      return Container(
          child:CardWidget(context,title,uuid)
      );
    }).toList(), );
}