import 'package:flutter/material.dart';
import '../widgets/quote_widget.dart';
import '../screens/settings_screen.dart';

class HomeScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Motivation"),
        actions: [ //  زر الإعدادات في الأعلى على اليمين
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(toggleTheme, isDarkMode),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuoteWidget(), // ✅ ويدجت الاقتباسات
          ],
        ),
      ),
    );
  }
}