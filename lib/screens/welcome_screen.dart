import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';
//import 'settings_screen.dart';  // استيراد شاشة الإعدادات إذا كنت بحاجة إليها

class WelcomeScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  WelcomeScreen(this.toggleTheme, this.isDarkMode);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final StreamController<String> _streamController = StreamController<String>();

  void _submitData() {
    final name = _nameController.text;
    final age = _ageController.text;
    if (name.isNotEmpty && age.isNotEmpty) {
      _streamController.add('مرحبًا $name😊! نتمنى أن تستفيد من هذه النصائح.');
      Future.delayed(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(
              toggleTheme: widget.toggleTheme,  // تمرير دالة تغيير الوضع
              isDarkMode: widget.isDarkMode,    // تمرير حالة الوضع
            ),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.comment),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '!😇مرحبًا بك يا صديقي',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'أدخل اسمك',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                  labelText: 'أدخل عمرك',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('ابدأ'),
              ),
              SizedBox(height: 20),
              StreamBuilder<String>(
                stream: _streamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: TextStyle(fontSize: 18),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}