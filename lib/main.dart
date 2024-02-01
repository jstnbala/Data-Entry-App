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
      title: 'CCMOBPGL Mobile Programming Course',
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
    );
  }
}
