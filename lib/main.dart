import 'package:data_entry_app/registration_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Self-Paced Activity 4 Manage and Handle Flutter Inputs',
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
