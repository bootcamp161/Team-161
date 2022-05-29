import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';
import 'package:mentorwiseasil/widgets/get_user_name.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({
    Key? key,
  }) : super(key: key);

  // List mentorIDs;

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final user = FirebaseAuth.instance.currentUser!;

  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('users').snapshots();

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((element) {
          // print(element.reference);
          docIDs.add(element.reference.id);
        }));
  }

  Future getMentorId() async {
    await FirebaseFirestore.instance.collection('mentors').get().then((snapshot) => snapshot.docs.forEach((element) {
          mentorIDs.add(element.reference.id);
        }));
  }

 

  List<String> docIDs = [];

  @override
  Widget build(BuildContext context) {
    var baslikStyle = GoogleFonts.abhayaLibre(color: Colors.black, fontSize: 25.sp);
    var baslikStyleBold = GoogleFonts.abhayaLibre(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('MentorWise', style: GoogleFonts.merriweather(fontSize: 25.sp, color: const Color(0xff6367BA))),
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/message');
              },
              icon: const Icon(Icons.send))
        ],
      ),
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
                        Text('MentorWise',
                            style: GoogleFonts.merriweather(fontSize: 25.sp, color: const Color(0xff6367BA)))
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const WelcomePage()), (route) => false);
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
                  },
                  child: const Text('Çıkış Yap'))
            ],
          )),
      body: Padding(
        padding: EdgeInsets.all(20.0.r),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Selam ',
                          style: baslikStyle,
                        ),
                        Text(
                          '${user.email}',
                          style: baslikStyleBold,
                        ),
                      ],
                    ),
                    Text(
                      'Favori mentörünü bul..',
                      style: baslikStyle,
                    ),
                  ],
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Haftanın Mentorları',
                        style: baslikStyleBold,
                      ),
                    ],
                  ),
                  Expanded(
                      child: FutureBuilder(
                          future: getMentorId(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  var containers = mentorIDs
                                      .map((name) => Container(
                                            child: Padding(
                                              padding: EdgeInsets.only(right: 30.0.r),
                                              child: InkWell(
                                                onTap: () {
                                                  print('tıklandı');
                                                },
                                                child: Container(
                                                    width: 170.w,
                                                    height: 200.h,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red, borderRadius: BorderRadius.circular(15.r)),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(8.0.r),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                              width: 100,
                                                              height: 100,
                                                              child: GetMentorImage(documentId: mentorIDs[index])),
                                                          ListTile(
                                                            title: GetMentorName(documentId: mentorIDs[index]),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                            ),
                                          ))
                                      .toList();
                                  return containers[index];
                                },
                                itemCount: mentorIDs.toList().toSet().length);
                          })),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Okumaya Devam Et',
                        style: baslikStyleBold,
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r), color: Colors.red),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: users,
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('hata');
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Text('Loading');
                          }
                          final data = snapshot.requireData;

                          return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'My name is ${data.docs[index]['name']} and my email is ${data.docs[index]['email']}'),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
