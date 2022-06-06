import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/card_utilites.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/utilities/lists.dart';

import '../utilities/color_text_utilities1.dart';
import '../utilities/utils.dart';

class ChangeEmailPage extends StatefulWidget {
  const ChangeEmailPage({Key? key}) : super(key: key);

  @override
  State<ChangeEmailPage> createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeEmailPage> {
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
                      Text('Güncel E-Posta: ${user.email}', style: baslikStyle,),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email) ? 'Geçerli bir e-posta giriniz' : null,
                        autofillHints: const [AutofillHints.email],
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorUtilites.textFieldBorderColor),
                            borderRadius: borderRadiusC,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: ColorUtilites.black),
                            borderRadius: borderRadiusC,
                          ),
                          labelText: 'Yeni E-Posta',
                          suffixIcon: _emailController.text.isEmpty
                              ? Container(width: 0)
                              : IconButton(
                                  icon: iconClear(),
                                  onPressed: () {
                                    _emailController.clear();
                                  },
                                ),
                          labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            await FirebaseAuth.instance.currentUser!.updateEmail(_emailController.text.trim());
                          } on FirebaseAuthException catch (e) {
                            Utils.showSnackBar('$e');
                          }
                          Utils.showSnackBar('E-posta değiştirildi');
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(color: ColorUtilites.blue, borderRadius: borderRadiusC),
                          child: const ListTile(
                            title: Center(child: Text('E-Posta Güncelle')),
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
