import 'package:flutter/material.dart';

Widget LoadingPageWidget(BuildContext context) {
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