import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/card_utilites.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/utilities/lists.dart';

import '../utilities/color_text_utilities1.dart';
import '../utilities/utils.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: backButton(),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(width: 200.w, height: 200.h, child: Image.asset('assets/images/MentorWiseLogo.png')),
                      Text(
                        'Güncel E-Posta: ${user.email}',
                        style: baslikStyle,
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.currentUser!.delete();
                          } on FirebaseAuthException catch (e) {
                            print(e);
                          }
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                            builder: (context) {
                              return WelcomePage();
                            },
                          ), (route) => false);
                          Utils.showSnackBar('Hesabınız Silinmiştir Giriş Ekranın Yönlendiriliyorsunuz');
                        },
                        child: Container(
                          decoration: BoxDecoration(color: ColorUtilites.red, borderRadius: borderRadiusC),
                          child: const ListTile(
                            title: Center(child: Text('Hesabı Sil')),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
