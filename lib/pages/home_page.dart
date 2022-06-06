// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/pages/mentor_profile.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/get_blog_data.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';
import 'package:mentorwiseasil/widgets/get_user_name.dart';

import 'blog_text.dart';
import 'hakkinda_page.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({
    Key? key,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    var baslikStyle = GoogleFonts.abhayaLibre(color: Colors.black, fontSize: 25.sp);
    var baslikStyleBold = GoogleFonts.abhayaLibre(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarHomePage(context),
      drawer: _drawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              Container(
                  child: Align(alignment: Alignment.centerLeft, child: _girisMesaj(baslikStyle, baslikStyleBold))),
              Container(
                  decoration: BoxDecoration(color: const Color(0xff8487C8), borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: 200.h,
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.0.r),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                                      return HakkindaPage();
                                    },));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12.r),
                                    decoration:
                                        BoxDecoration(color: ColorUtilites.bej, borderRadius: BorderRadius.circular(15)),
                                    child: Text('UYGULAMA HAKKINDA BİLGİLER',
                                        style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 17)),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0.h),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/mentorol');
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12.r),
                                      decoration: BoxDecoration(
                                          color: ColorUtilites.bej, borderRadius: BorderRadius.circular(15.r)),
                                      child: Text('NASIL MENTOR OLABİLİRİM?',
                                          style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 17.sp)),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/blogyaz');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12.r),
                                    decoration: BoxDecoration(
                                        color: ColorUtilites.bej, borderRadius: BorderRadius.circular(15.r)),
                                    child: Text(
                                      'NASIL BLOG YAZILIR?',
                                      style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.bold, fontSize: 17.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                            left: 0,
                            child: Column(
                              children: [
                                SizedBox(child: Image.asset('assets/images/homepage.png')),
                              ],
                            )),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'EN İYİ MENTORLAR',
                      style: baslikStyleBold,
                    ),
                  ],
                ),
              ),
              mentorlar(),
              // const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Bizim Hakkımızda',
                      style: baslikStyleBold,
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: ColorUtilites.bej,
                    border: Border.all(width: 5, color: const Color(0xff310707))),
                child: Padding(padding: EdgeInsets.all(8.0.r), child: hakimizda()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      'İletişim Bilgilerimiz',
                      style: baslikStyleBold,
                    ),
                  ],
                ),
              ),
              Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('bootcamp161@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('+905522294869'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text hakimizda() {
    return Text(
      'Mentor Wise ekibi olarak girişimcilerin, pazarlama, network ve iş geliştirme alanında eksiklikler yaşadıklarını, doğru müşteri kitlelerine ulaşmakta güçlük çektiklerini gözlemledik.' +
          '\nBu sorunun çözümüne yönelik olarak alanında yetkin mentorların girişimicilere çeşitli alanlarda danışmanlık hizmetleri sunabilecekleri bir platform olan Mentor Wise projesini geliştirdik.' +
          '\nPlatformda danışmanlık hizmetlerinin yanı sıra farklı alanlarda yazılmış blog yazılarının da içinde bulunduğu zengin bir içerik havuzu da bulunmaktadır.' +
          '\nMentor Wise ekibi olarak, rekabetin ve risklerin giderek arttığı günümüz şartlarında daha sürdürülebilir ekonomik çözümler ve stratejiler belirleyebilmeleri için  girişimciler ile işbirliği yapabilmek amacı ile bu yola çıktık.' +
          '\nBu süreçte yanımızda olup desteklerini esirgemeyen herkese teşekkürler.',
      style: baslikStyle.copyWith(fontSize: 15),
    );
  }

  Container mentorlar() {
    return Container(
      width: double.infinity,
      height: 150.h,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) {
                                      return MentorProfilePage(index: index);
                                    },
                                  ));
                                },
                                child: Container(
                                    width: 130.w,
                                    height: 160.h,
                                    decoration: BoxDecoration(
                                        color:
                                            index < 3 ? mentorColor[index] : mentorColor[index - 3],
                                        borderRadius: BorderRadius.circular(15.r)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                            width: 100.w,
                                            height: 100.h,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 8.0.r),
                                              child: GetMentorImage(documentId: mentorIDs[index]),
                                            )),
                                        GetMentorName(documentId: mentorIDs[index])
                                      ],
                                    )),
                              ),
                            ),
                          ))
                      .toList();
                  return containers[index];
                },
                itemCount: mentorIDs.toList().toSet().length);
          }),
    );
  }

  AppBar _appBarHomePage(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text('MentorWise', style: GoogleFonts.merriweather(fontSize: 25.sp, color: const Color(0xff6367BA))),
      iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
      backgroundColor: Colors.white,
    );
  }

  Wrap _girisMesaj(TextStyle baslikStyle, TextStyle baslikStyleBold) {
    return Wrap(
      children: [
        Text(
          'Selam ',
          style: baslikStyle,
        ),
        Text(
          '${user.displayName}',
          style: baslikStyleBold,
        ),
        Text(
          'Favori mentörünü bul..',
          style: baslikStyle,
        ),
      ],
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
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
        ));
  }
}
