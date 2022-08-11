import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do/widget/card_widget.dart';


Widget ListTaskWidget(BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){

  return ListView(
    padding: EdgeInsets.all(20),

    children: snapshot.data!.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> data =
      document.data()! as Map<String, dynamic>;
      var title =data['title'];
      var uuid=data['uid'];
      var status=data['status'];

      return  CardWidget(context,title,uuid);

    }).toList(), );
}