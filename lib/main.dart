import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
//import 'screens/settings_screen.dart';  // تأكد من استيراد شاشة الإعدادات إذا كانت موجودة

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  // دالة تغيير الوضع
  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: WelcomeScreen(toggleTheme, isDarkMode), // تمرير الدالة والحالة إلى WelcomeScreen
    );
  }
}