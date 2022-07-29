import 'package:flutter/material.dart';


Widget EmptyPageWidget(BuildContext context){

  return Center(
    child:Column(
      children: [

        Container(
            width: 400,
            child: Image.asset('/img/empty.jpg')),

       const SizedBox(height: 20),
        const Text('Empty Page')

      ],
    )

  );






}




