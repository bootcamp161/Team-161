import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';

class MentorOl extends StatefulWidget {
  const MentorOl({Key? key}) : super(key: key);

  @override
  State<MentorOl> createState() => _MentorOlState();
}

class _MentorOlState extends State<MentorOl> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: mentorolappbar(context),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Column(
                    children: [
                      Text('Nasıl Mentor Olabilirim?', style: baslikStyleBold,),
                      Text(
                        'Platform içerisinde farklı alanlarda danışmanlık hizmeti veren pek çok mentorumuz bulunmakta  ve her zaman farklı alanlarda uzmanlığı bulunan ilham verici ekip arkadaşlarına ihtiyaç duyuyoruz.' +
                            '\nMentorlarımızdan biri olmak istiyorsan aşağıda yer alan form üzerinden başvuru yaparak bize ulaşman yeterli, olumlu başvurulara mail ile dönüş yapıyoruz ve online bir görüşme talep ediyoruz görüşme sonucunda nihai sonucu en kısa sürede adaylara bildiriyoruz.' +
                            '\nOlumsuz sonuçlanan başvuruların moralinizi bozmasına izin vermeyin, yeni başvurulara her zaman açığız, bir girişimci olarak denemekten vazgeçmeyin : )',
                        style: baslikStyle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/mentorform');
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(color: ColorUtilites.blue, borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      leading: const Icon(
                        FontAwesome.google,
                        color: Colors.orange,
                      ),
                      title: Text(
                        'Form İçin Buraya Tıklayınız',
                        style: baslikStyle.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
