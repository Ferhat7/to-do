import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/pages/login_page.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCiwYbQ0bj1NfZn6edOZ9UO_fgy870bjq0",
        appId: "1:356705440868:web:b497d6008f03adad01bb71",
        messagingSenderId: "356705440868",
        projectId: "to-do-ferhat",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO-DO',
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home:LoginPage(),
    );
  }
}