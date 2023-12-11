
import 'package:flutter/material.dart';
import 'package:personalized_todo_list/screens/category_management.dart';
import 'package:personalized_todo_list/screens/home_page.dart';
import 'package:personalized_todo_list/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );
  }
}

  