import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/login_page_old.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utilities/color_text_utilities1.dart';
import '../oldpages/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtilites.white,
        appBar: const AppBarWidget(),
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            children: [
              Expanded(flex: 8, child: _carouselWidget(context)),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: horizontal8(),
                    child: _textWrap(),
                  )),
              Expanded(
                  child: Padding(
                padding: horizontal8(),
                child: Align(alignment: _left, child: buildIndicator()),
              )),
              Spacer(),
              Expanded(
                  flex: 2,
                  child: Row(
                    children: const [
                      Expanded(
                        child: _GirisButton(),
                      ),
                      Expanded(child: _BaslaButton()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Alignment get _left => Alignment.centerLeft;

  Wrap _textWrap() {
    return Wrap(
      alignment: WrapAlignment.center,
        children: [
          Text(
            textList[activeIndex],
            style: GoogleFonts.alegreya(fontSize: 26.sp),
          ),
          // buildIndicator(),
        ]);
  }

  EdgeInsets horizontal8() => EdgeInsets.symmetric(horizontal: 8.0.w);

  CarouselSlider _carouselWidget(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: controller,
      itemCount: imageList.length,
      itemBuilder: (context, index, realIndex) {
        final urlImage = imageList[index];
        return buildImage(urlImage, index);
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
          initialPage: 0,
          onPageChanged: (index, reason) => setState(
                (() => activeIndex = index),
              ),
          height: MediaQuery.of(context).size.height / 2.5,
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
        effect: ScrollingDotsEffect(
          dotHeight: 5.h,
          dotWidth: 30.w,
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}

class _GirisButton extends StatelessWidget {
  const _GirisButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const LogInPage(),
          ));
        },
        child: Container(
          decoration: const ShapeDecoration(
            shape: StadiumBorder(side: BorderSide(width: 1, color: Colors.black)),
          ),
          child: Center(
              child: Text(
            'Giriş Yap',
            style: TextUtilites().ButtonText.copyWith(color: Colors.black),
          )),
        ));
  }
}

class _BaslaButton extends StatelessWidget {
  const _BaslaButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Container(
          decoration: ShapeDecoration(
            color: ColorUtilites.blue,
            shape: const StadiumBorder(side: BorderSide(width: 1, color: Colors.black)),
          ),
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
                color: ColorUtilites.white,
              )
            ],
          )),
        ));
  }
}
