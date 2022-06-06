import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/login_with_mentorwise.dart';

import '../utilities/card_utilites.dart';
import '../utilities/color_text_utilities1.dart';
import '../utilities/icon_utilities.dart';
import '../utilities/utils.dart';

class ForgotPassword2 extends StatefulWidget {
  const ForgotPassword2({Key? key}) : super(key: key);

  @override
  State<ForgotPassword2> createState() => _ForgotPassword2State();
}

class _ForgotPassword2State extends State<ForgotPassword2> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus(); 
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtilites.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
              icon: backButton(),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: Form(
                key: _formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LogoWidget(),
                    Text(
                      'Parolanızı mı unuttunuz?',
                      style: GoogleFonts.inriaSans(color: Colors.black, fontSize: 25),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'E-posta adresinizi girin, parolanızı sıfırlamak için kullanacağınız linki içeren bir e-posta göndereceğiz.',
                      style: GoogleFonts.inriaSans(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 20.h),
                    _emailWidget(),
                    SizedBox(height: 20.h),
                    resetPasswordButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _emailWidget() {
    return TextFormField(
      validator: (email) => email != null && !EmailValidator.validate(email) ? 'Geçerli bir e-posta giriniz' : null,
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
        labelText: 'E-Posta',
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
    );
  }

  ElevatedButton resetPasswordButton() {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: borderRadiusC,
          )),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 60.h)),
          backgroundColor: MaterialStateProperty.all(ColorUtilites.blue)),
      onPressed: () {
        final form = _formKey.currentState!;
        FocusManager.instance.primaryFocus?.unfocus();

        if (form.validate()) {
          resetPassword();
          TextInput.finishAutofillContext();
        }
      },
      child: Text(
        'Şifreyi Sıfırla',
        style: GoogleFonts.inriaSans(fontSize: 22),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
      Utils.showSnackBar('Şifre Sıfırlama İsteği Gönderildi');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop;
    }
  }
}
