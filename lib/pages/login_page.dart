import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwise_2/pages/home_page.dart';
import 'package:mentorwise_2/utilities/google_sign_in.dart';

import 'SignIn_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordread = true;
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
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: _logoAvatar(),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: emailcard(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15),
                  child: passwordcard(context),
                ),
                const SizedBox(height: 15),
                sifremiunuttum(),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15),
                  child: girisyap(),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0, left: 15),
                  child: isFirebaseInitialized ? Googlegirisyap() : CircularProgressIndicator()
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return SignInPage();
                        },
                      ));
                    },
                    child: Text(
                      'Hesabın Yok Mu? Kayıt Ol',
                      style: GoogleFonts.abrilFatface(
                          color: const Color(0xFF000000), fontSize: 18, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ));
                    },
                    child: Text(
                      'Misafir Olarak Devam Et',
                      style: GoogleFonts.abrilFatface(
                          color: const Color(0xFF000000), fontSize: 18, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container girisyap() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xff414044)),
      child: ListTile(
        onTap: () {},
        title: Center(
            child: Text(
          'Giriş Yap!',
          style: GoogleFonts.abrilFatface(color: Color(0xffF7F7F7), fontSize: 24),
        )),
      ),
    );
  }
  Container Googlegirisyap() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xff414044)),
      child: ListTile(
        onTap: () async {
          await signInWithGoogle();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
        },
        title: Center(
            child: Text(
          'Google İle Giriş Yap!',
          style: GoogleFonts.abrilFatface(color: Color(0xffF7F7F7), fontSize: 24),
        )),
      ),
    );
  }

  InkWell sifremiunuttum() {
    return InkWell(
      child: Text(
        'Şifreni Mi Unuttun?',
        style: GoogleFonts.abrilFatface(color: Color(0xFFCCCCCC), fontSize: 18),
      ),
    );
  }

  Card passwordcard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF7585A0),
      child: ListTile(
        title: TextFormField(
          obscureText: passwordread,
          decoration: passwordDecoration()),
      ),
    );
  }

  InputDecoration passwordDecoration() {
    return InputDecoration(
      suffixIcon: IconButton(
        icon: Icon(
          passwordread ? Icons.visibility_off : Icons.visibility,
        ),
        iconSize: 35,
        color: const Color(0xff000000),
        onPressed: () {
          setState(() {
            passwordread = !passwordread;
          });
        },
      ),
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      hintText: 'Şifre',
      hintTextDirection: TextDirection.ltr,
      icon: const Icon(
        Icons.lock_rounded,
        color: Colors.black,
      ),
      hintStyle: GoogleFonts.abrilFatface(),
    );
  }

  Card emailcard(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF7585A0),
      child: ListTile(
        title: TextFormField(
          decoration: emailDecoration(context),
        ),
      ),
    );
  }

  CircleAvatar _logoAvatar() {
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/mentorwise_login.jpg'),
      radius: 100,
    );
  }

  InputDecoration emailDecoration(BuildContext context) {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      hintText: 'Email',
      hintTextDirection: TextDirection.ltr,
      icon: Icon(
        Icons.email,
        color: Colors.black,
      ),
      hintStyle: GoogleFonts.abrilFatface(),
    );
  }
}
