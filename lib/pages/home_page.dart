import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hoş geldin ${user.email}', style: Theme.of(context).textTheme.headline5,),
            TextButton(onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
                FirebaseAuth.instance.signOut();
                GoogleSignIn().signOut();
            }, child: const Text('Çıkış Yap'))
          ],
        ),
      ),
    );
  }
}