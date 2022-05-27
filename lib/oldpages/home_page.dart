import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              
              children: [
                DrawerHeader(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 90.w, height: 90.h, child: Image.asset('assets/images/MentorWiseLogo.png')),
                          Text('MentorWise', style: GoogleFonts.merriweather(fontSize: 25, color: Color(0xff6367BA)))
                        ],
                      ),
                    ],
                  ),
                ),
              
              ],
            )),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hoş geldin ${user.email}',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
                  },
                  child: const Text('Çıkış Yap'))
            ],
          ),
        ),
      ),
    );
  }
}
