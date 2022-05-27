import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mentorwiseasil/google_sign_in.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import 'package:mentorwiseasil/pages/bottom_navigator.dart';
import 'package:mentorwiseasil/pages/login_with_mentorwise.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final blueLogoUrl = 'assets/images/logo_for_button.png';
  final logoUrl = 'assets/images/MentorWiseLogo.png';
  final buttonText = 'MentorWise ile giriş yap';
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    initializeFirebase();
    super.initState();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: backAppBar(context),
        backgroundColor: ColorUtilites.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0.r),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset(logoUrl),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: mentorWiseButton(context),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Expanded(child: facebookButton()),
                        // SizedBox(width: 10.w),
                        Expanded(child: googleButton()),
                      ],
                    ),
                  )
                ]),
              ),
              SizedBox(height: 100.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: _bottomText(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar backAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => WelcomePage()), (route) => false);
        },
        icon: const Icon(
          Icons.chevron_left,
          color: Colors.black,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  SizedBox mentorWiseButton(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: InkWell(
        onTap: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => StreamBuilder<User?>(
                  stream: FirebaseAuth.instance.authStateChanges(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Giriş yapılamadı lütfen tekrar deneyin'),
                      );
                    }
                    if (snapshot.hasData) {
                      return HomePage(); // burayı ana sayfa yapmak gerekiyor değiştirmeyi unutma
                    } else {
                      return LoginWithMentorWise();
                    }
                  }),
            ),
            (route) => false,
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          color: ColorUtilites.blue,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              blueLogoUrl,
            ),
            Text(
              buttonText,
              style: TextUtilites().ButtonText.copyWith(fontSize: 22.sp),
            ),
          ]),
        ),
      ),
    );
  }

  SizedBox facebookButton() {
    return SizedBox(
        height: 80.h,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r), side: const BorderSide()),
          child: Icon(
            Brandico.facebook_1,
            color: ColorUtilites.blue,
            size: 40.sp,
          ),
        ));
  }

  InkWell googleButton() {
    return InkWell(
      onTap: () async {
        await signInWithGoogle();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
      },
      child: SizedBox(
          height: 80.h,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r), side: const BorderSide()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesome.google,
                  color: ColorUtilites.red,
                  size: 40.sp,
                ),
                Text(
                  ' Google ile giriş yap',
                  style: TextUtilites().ButtonText.copyWith(fontSize: 22.sp, color: Colors.black),
                ),
              ],
            ),
          )),
    );
  }

  Wrap _bottomText() {
    return Wrap(
      children: [
        Text(
          "Giriş yaparak, MentorWise'ın ",
          style: defaultTextStyle(),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            'Kullanım Koşullarını',
            style: defaultTextStyle().copyWith(fontWeight: boldText, decoration: underline),
          ),
        ),
        Text(
          've ',
          style: defaultTextStyle(),
        ),
        InkWell(
            onTap: () {},
            child: Text(
              'Gizlilik Politikasını',
              style: defaultTextStyle().copyWith(fontWeight: boldText, decoration: underline),
            )),
        Text(
          ' kabul etmiş olursunuz.',
          style: defaultTextStyle(),
        ),
      ],
    );
  }

  TextDecoration get underline => TextDecoration.underline;

  FontWeight get boldText => FontWeight.bold;

  TextStyle defaultTextStyle() => GoogleFonts.inriaSans(fontSize: 18.sp, color: const Color(0xff666666));
}
