import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  SettingsScreen(this.toggleTheme, this.isDarkMode);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  @override
  void didUpdateWidget(covariant SettingsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isDarkMode != oldWidget.isDarkMode) {
      setState(() {
        _isDarkMode = widget.isDarkMode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Text("تغيير الوضع "),
            Switch(
              value: _isDarkMode,
              onChanged: (value) {
                widget.toggleTheme(value);
                setState(() {
                  _isDarkMode = value;
                }); // تحديث الواجهة
              },
            ),
          ],
        ),
      ),
    );
  }
}