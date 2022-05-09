import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentorwise_2/utilities/google_sign_in.dart';

import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(FirebaseAuth.instance.currentUser == null ? 'Misafir Kullanıcı' : FirebaseAuth.instance.currentUser!.displayName!)),
              ListTile(
                title: const Text('Çıkış Yap'),
                onTap: () async{
                  await signOutWithGoogle();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
                }
              )
            ],
          ),
        ));
  }
}
