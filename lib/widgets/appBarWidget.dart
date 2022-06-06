import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/oldpages/login_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import '../utilities/icon_utilities.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leadingWidth: 75.w,
      elevation: 0,
      backgroundColor: Colors.transparent,
      // leading: Image.asset(
      //   "assets/images/MentorWiseLogo.png",
      //   fit: BoxFit.cover,
      // ),
      title: Row(
        children: [
          Image.asset(
        "assets/images/MentorWiseLogo.png",
        fit: BoxFit.cover,
        width: 75.w,
      ),
          Text(
            'MentorWise',
            style: GoogleFonts.merriweather(color: ColorUtilites.blue, fontSize: 43.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}


 AppBar logAndSignInAppBar(BuildContext context) {
    return AppBar(
          leading: IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage2()), (route) => false);
            },
            icon: backButton(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        );
  }

  AppBar mentorolappbar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('MentorWise', style: GoogleFonts.merriweather(fontSize: 25.sp, color: const Color(0xff6367BA))),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: backButton()),
      );
  }