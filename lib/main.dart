import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mentorwise_2/pages/home_page.dart';
import 'package:mentorwise_2/pages/login_page.dart';
import 'package:mentorwise_2/utilities/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MentorWise',
      home: LoginPage(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeFireBase();
  }

  Future<void> initializeFireBase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    //loginPageGit();
  }

  void loginPageGit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isFirebaseInitialized
            ? ElevatedButton(
                onPressed: () async {
                  await signInWithGoogle();
                  loginPageGit();
                },
                child: Text('Google Sign In'),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
