import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/oldpages/login_page_old.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../pages/login_page.dart';

class OpenPage extends StatefulWidget {
  const OpenPage({Key? key}) : super(key: key);

  @override
  State<OpenPage> createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  final controller = CarouselController();
  int activeIndex = 0;
  final imageList = [
    'assets/images/openPageImages/image_1.png',
    'assets/images/openPageImages/image_2.png',
    'assets/images/openPageImages/image_3.png',
  ];

  final textList = [
    'En iyi mentorlarla bağlantı kurun.',
    '24 saat içinde mentorlük talebin karşılansın.',
    'Deneyim sahibi kişilerin tecrübelerini anlattığı yazıları oku.',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtilites.beyaz,
        appBar: const AppBarWidget(),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  _carouselSliderWidget(),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    
                    child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0), child: _textColumn())),
                  Spacer(),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                          children: [buildIndicator()],
                          ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginPage2(),
                                    ));
                                  },
                                  child: Container(
                                    decoration: const ShapeDecoration(
                                      shape: StadiumBorder(side: BorderSide(width: 1, color: Colors.black)),
                                    ),
                                    width: 173,
                                    height: 57,
                                    child: Center(
                                        child: Text(
                                      'Giriş Yap',
                                      style: TextUtilites().ButtonText.copyWith(color: Colors.black),
                                    )),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      color: ColorUtilites.mavi,
                                      shape: const StadiumBorder(side: BorderSide(width: 1, color: Colors.black)),
                                    ),
                                    width: 173,
                                    height: 57,
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Başla',
                                          style: TextUtilites().ButtonText,
                                        ),
                                        const SizedBox(width: 10),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: ColorUtilites.beyaz,
                                        )
                                      ],
                                    )),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _textColumn() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        textList[activeIndex],
        style: GoogleFonts.alegreya(fontSize: 28),
      )
    ]);
  }

  CarouselSlider _carouselSliderWidget() {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: imageList.length,
      itemBuilder: (context, index, realIndex) {
        final urlImage = imageList[index];
        return buildImage(urlImage, index);
      },
      options: CarouselOptions(
          initialPage: 0,
          onPageChanged: (index, reason) => setState(
                (() => activeIndex = index),
              ),
          height: MediaQuery.of(context).size.height /2.5,
          autoPlay: true),
    );
  }

  Widget buildImage(String imageCount, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Image.asset(imageCount, fit: BoxFit.cover),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imageList.length,
        onDotClicked: animateToSlide,
        effect: const WormEffect(
          dotHeight: 5,
          dotWidth: 30,
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
