import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  height: 71,
                  width: 55,
                  child: Image.asset(
                    "assets/images/MentorWiseLogo.png",
                    fit: BoxFit.cover,
                  )),
              Text(
                'MentorWise',
                style: GoogleFonts.merriweather(color: ColorUtilites.mavi, fontSize: 47, fontWeight: FontWeight.bold),
              ),
              // IconButton(
              //   iconSize: 32,
              //   color: Colors.black,
              //   icon: const Icon(Icons.language),
              //   onPressed: () {},
              // )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
