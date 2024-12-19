import 'package:flutter/material.dart';
import 'package:simple_todo/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Pretendard",
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffA294F9),
          secondary: const Color(0xffE5D9F2),
          surface: const Color(0xffCDC1FF),
        ),
      ),
      home: const HomePage(),
    );
  }
}
