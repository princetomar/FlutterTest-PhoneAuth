import 'package:flutter/material.dart';
import 'package:learnify_proj/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learnify Project',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
