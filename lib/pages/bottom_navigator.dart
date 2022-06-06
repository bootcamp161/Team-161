import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/pages/blog_page.dart';
import 'package:mentorwiseasil/pages/home_page.dart';
import 'package:mentorwiseasil/pages/mentor_page.dart';
import 'package:mentorwiseasil/pages/profile_page.dart';
import 'package:mentorwiseasil/pages/register_page.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/lists.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((element) {
          
          docIDs.add(element.reference.id);
        }));
  }
  final pages = [
    HomePage2(),
    MentorPage(),
    BlogPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;

  @override
  void initState() {
    FocusManager.instance.primaryFocus?.unfocus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: Colors.white,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'AnaSayfa'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Arama'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Blog'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profilim'),
          ],
          type: BottomNavigationBarType.fixed,
          // fixedColor: ColorUtilites.blue,
          backgroundColor: ColorUtilites.blue,
          showUnselectedLabels: false,
          iconSize: 40,
        ),
        body: pages[currentIndex],
      ),
    );
  }
}
