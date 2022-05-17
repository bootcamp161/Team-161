import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/login_page.dart';
import 'package:mentorwiseasil/pages/welcomePage.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenPage(),
    );
  }
}
