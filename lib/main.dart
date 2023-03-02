import 'package:app_todo/pages/list_page.dart';
import 'package:app_todo/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App TODO',
      theme: ThemeData(
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Colors.purpleAccent[700],
      ),
      debugShowCheckedModeBanner: false,
      home: ListaTarefas(),
    );
  }
}
