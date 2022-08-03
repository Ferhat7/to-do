 import 'package:flutter/material.dart';

Widget Error_Widget(BuildContext context){
  return Center(
      child:Column(
        children: [
          Container(
              width: 400,
              child: Image.asset('/img/error.jpg')),
          const SizedBox(height: 20),
          const Text('ERROR')

        ],
      )

  );

}