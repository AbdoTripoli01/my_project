import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math'; // لاستعمال العشوائية

class QuoteWidget extends StatefulWidget {
  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  String quote = "   Click To Fetch The New Quote !👇";
  bool isLoading = false;

  // 🔹 قائمة الاقتباسات (تمت إضافة المزيد منها)
  final List<String> quotes = [
    "ابقَ إيجابيًا، واصل التقدم !😊💪",
    "النجاح يأتي بالمثابرة والعمل الجاد !🏆🔥",
    "كل يوم هو فرصة جديدة للنجاح !🌅✨",
    "الإرادة القوية تصنع المعجزات !💪🌟",
    "حلمك يستحق المحاولة، لا تستسلم !🌈💖",
    "الطريق إلى النجاح مليء بالعقبات، لكنك تستطيع تخطيها !🛤️🚀",
    "ثق بنفسك، فأنت أقوى مما تتخيل !💯💪",
    "الأحلام الكبيرة تبدأ بخطوة صغيرة !🌱👣",
    "لا تنتظر الفرص، اصنعها بنفسك !🔨💡",
    "التغيير يبدأ عندما تؤمن بقدرتك على تحقيقه !🔄💫",
    "لا شيء مستحيل إذا كنت مؤمنًا بنفسك !🦸‍♂️🌟",
    "لا تتوقف عندما تتعب، توقف عندما تنجح !🏁🥇",
    "كن الشخص الذي تريد أن تكونه، ليس الشخص الذي يريدك الآخرون أن تكونه !🙌💙",
    "تعلم من الأمس، عش اليوم، واملأ الغد بالأمل !📚🌞",
    "الأمل هو الوقود الذي يبقيك مستمرًا حتى في أصعب الأوقات !💖🔥",
  ];

  // 🔹 دالة لجلب اقتباس عشوائي مع تأثير تحميل
  Future<void> fetchQuote() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2)); // محاكاة تحميل البيانات

    setState(() {
      isLoading = false;
      quote = quotes[Random().nextInt(quotes.length)]; // اختيار اقتباس عشوائي
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isLoading
            ? CircularProgressIndicator() // عرض مؤشر تحميل أثناء جلب الاقتباس
            : Text(
                quote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: fetchQuote, // عند الضغط يتم تغيير الاقتباس
          child: Text("  Fetch New Quote"),
        ),
      ],
    );
  }
}
