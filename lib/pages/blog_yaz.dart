import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';

class BlogYaz extends StatefulWidget {
  const BlogYaz({Key? key}) : super(key: key);

  @override
  State<BlogYaz> createState() => _BlogYazState();
}

class _BlogYazState extends State<BlogYaz> {
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
                      Text('Nasıl Blog Yazılır?', style: baslikStyleBold,),
                      Text(
                        'Platform içerisinde farklı alanlarda yazılmış blog yazıları bulunmaktadır ve her zaman yeni içerik üreticilerine ihtiyacımız var.' +
                            '\nBlog yazarlarımızdan biri olmak istiyorsan aşağıda yer alan form üzerinden başvuru yaparak bize ulaşman yeterli, olumlu başvurulara en kısa sürede dönüş yapmaya çalışıyoruz.' +
                            '\nOlumsuz sonuçlanan başvuruların moralinizi bozmasına izin vermeyin, yeni başvurulara her zaman açığız, bir girişimci olarak denemekten vazgeçmeyin : )',
                        style: baslikStyle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/blogform');
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
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
