import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/main.dart';
import 'package:mentorwiseasil/pages/register_page.dart';
import 'package:mentorwiseasil/utilities/card_utilites.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../oldpages/login_page.dart';
import '../widgets/appBarWidget.dart';
import 'login_page_old.dart';

class LoginWithMentorWise extends StatefulWidget {
  const LoginWithMentorWise({Key? key}) : super(key: key);

  @override
  State<LoginWithMentorWise> createState() => _LoginWithMentorWiseState();
}

class _LoginWithMentorWiseState extends State<LoginWithMentorWise> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordRead = true;
  String _error = '';

  @override
  void initState() {
    super.initState();

    _emailController.addListener(stateListener);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailController.removeListener(stateListener);
    super.dispose();
  }

  void stateListener() => setState(() {});

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
                Navigator.of(context)
                    .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LogInPage()), (route) => false);
              },
              icon: backButton(),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              primary: false,
              child: Center(
                child: Column(
                  children: [
                    AutofillGroup(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(),
                          Container(
                            color: ColorUtilites.red,
                            child: _error.length > 1 ?  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(_error),
                            ): SizedBox() ,
                          ),
                          SizedBox(height: 20.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                            child: emailWidget(),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                            child: passwordWidget(),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: girisYap(),
                          ),
                          SizedBox(height: 10.h),
                          parolamiUnuttum(),
                        ],
                      ),
                    ),
                    SizedBox(height: 80.h),
                    Column(
                      children: [kaydol()],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell kaydol() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ));
      },
      child: Text(
        'Hesabınız mı yok? Şimdi Kaydolun.',
        style: GoogleFonts.inriaSans(
            color: const Color(0xff424242), fontSize: 20.sp, decoration: TextDecoration.underline),
      ),
    );
  }

  InkWell parolamiUnuttum() {
    return InkWell(
      onTap: () {},
      child: Text(
        'Parolanızı mı unuttunuz?',
        style: GoogleFonts.inriaSans(color: const Color(0xff5E5E5E), fontSize: 18.sp),
      ),
    );
  }

  InkWell girisYap() {
    return InkWell(
      onTap: () {
        setState(() {
          signIn();
        });
        // signIn();
        final form = formKey.currentState!;
        FocusManager.instance.primaryFocus?.unfocus();

        if (form.validate()) {
          TextInput.finishAutofillContext();
        }
      },
      child: SizedBox(
        height: 60.h,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: borderRadiusC),
          color: ColorUtilites.blue,
          child: Center(
            child: Text(
              'Giriş Yap',
              style: TextUtilites().ButtonText.copyWith(fontSize: 22.sp),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField passwordWidget() {
    return TextFormField(
      validator: (password) => password != null && password.length < 6 ? 'Parolanız en az 6 karekter olmalıdır' : null,
      autofillHints: [AutofillHints.password],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      obscureText: _passwordRead,
      controller: _passwordController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: ColorUtilites.black), borderRadius: borderRadiusC),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtilites.textFieldBorderColor),
            borderRadius: borderRadiusC,
          ),
          // errorText: 'Parola yanlış',
          labelText: 'Parola',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordRead = !_passwordRead;
                });
              },
              icon: _passwordRead ? iconVisibOff() : iconVisibOn()),
          errorBorder: OutlineInputBorder(borderRadius: borderRadiusC),
          labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey[600])),
    );
  }

  TextFormField emailWidget() {
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
        labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey[600]),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _error = '${e.message}';
      });
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

class LogoWidget extends StatelessWidget {
  final logoUrl = 'assets/images/MentorWiseLogo.png';

  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: Image.asset(
        logoUrl,
      ),
    );
  }
}
