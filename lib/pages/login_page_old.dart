import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import 'login_with_mentorwise.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final blueLogoUrl = 'assets/images/logo_for_button.png';
  final logoUrl = 'assets/images/MentorWiseLogo.png';
  final buttonText = 'MentorWise ile giriş yap';


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
                  mentorWiseButton(context),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      facebookButton(),
                      SizedBox(width: 10.w),
                      googleButton(),
                    ],
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
          Navigator.of(context).pop();
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
      width: 320.w,
      height: 70.h,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginWithMentorWise(),
          ));
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
              style: TextUtilites().ButtonText.copyWith(fontSize: 20.sp),
            ),
          ]),
        ),
      ),
    );
  }

  SizedBox facebookButton() {
    return SizedBox(
        width: 155.w,
        height: 70.h,
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

  SizedBox googleButton() {
    return SizedBox(
        width: 155.w,
        height: 70.h,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r), side: const BorderSide()),
          child: Icon(
            FontAwesome.google,
            color: ColorUtilites.red,
            size: 40.sp,
          ),
        ));
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
