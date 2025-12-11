import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'pages/welcome_page.dart';

void main() {
  runApp(const BudayaApp());
}

class BudayaApp extends StatelessWidget {
  const BudayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Budaya App",
      theme: AppTheme.lightTheme,
      home: WelcomePage(), // nanti kamu buat
    );
  }
}
