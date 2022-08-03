import 'package:flutter/material.dart';

Widget Loading_Widget(BuildContext context) {
  return Center(
      child: Column(
        children: [
      const CircularProgressIndicator(),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text('Loading...'),
          )

        ],
      )

  );
}