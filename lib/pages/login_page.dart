import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import '../utilities/card_utilites.dart';
import 'login_with_mentorwise.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({Key? key}) : super(key: key);

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final imageUrl = 'assets/images/MentorWiseLogo.png';
  final buttonLogoUrl = 'assets/images/logo_for_button.png';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarBuilt(context),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 12, child: Image.asset(imageUrl)),
                        const Spacer(),
                        Expanded(
                          flex: 4,
                          child: _mentorWiseButton(context),
                        ),
                        const Spacer(),
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Expanded(child: _facebookButton()),
                                Expanded(child: _googleButton()),
                              ],
                            )),
                      ],
                    ),
                  )),
              const Spacer(flex: 1),
              Expanded(flex: 2, child: _bottomText())
            ],
          ),
        ),
      ),
    );
  }

  InkWell _mentorWiseButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginWithMentorWise(),
        ));
      },
      child: Card(
        elevation: 5,
        shape: cardBorder(),
        color: ColorUtilites.mavi,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(buttonLogoUrl),
          Text(
            'MentorWise ile giriş yap',
            style: TextUtilites().ButtonText.copyWith(fontSize: 22),
          ),
        ]),
      ),
    );
  }


  AppBar appBarBuilt(BuildContext context) {
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
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Card _facebookButton() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Icon(
          Brandico.facebook_1,
          color: ColorUtilites.mavi,
          size: 40,
        ),
      ),
    );
  }

  Card _googleButton() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide()),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Icon(
          FontAwesome.google,
          color: Color(0xffF24E1E),
          size: 40,
        ),
      ),
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

  TextStyle defaultTextStyle() => GoogleFonts.inriaSans(fontSize: 18, color: const Color(0xff666666));
}
