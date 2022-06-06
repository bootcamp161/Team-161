import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';

class HakkindaPage extends StatefulWidget {
  const HakkindaPage({Key? key}) : super(key: key);

  @override
  State<HakkindaPage> createState() => _HakkindaPageState();
}

class _HakkindaPageState extends State<HakkindaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: mentorolappbar(context),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 200.w,
                  height: 200.h,
                  child: Image.asset('assets/images/MentorWiseLogo.png'),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text('Uygulama Hakkında Bilgiler', style: baslikStyleBold,),
                      Text('•Mentorlarımızı inceleyebilir, iletişim bilgilerini öğrenip onlar ile iletişime geçebilirsin.', style: GoogleFonts.amiri(fontSize: 20),),
                      Text('•Birçoğu alanında uzman mentorlarımızın yazdıkları blogları okuyabilirsin.', style: GoogleFonts.amiri(fontSize: 20),),
                      Text('•Mentorlarımızdan biri veya blog yazarlarımızdan olmak istiyorsan bize ulaşabilirsin.', style: GoogleFonts.amiri(fontSize: 20),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}