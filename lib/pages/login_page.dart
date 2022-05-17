import 'package:flutter/material.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:mentorwiseasil/utilities/TextStlyeUtitlites.dart';

import 'login_with_mentorwise.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
        ),
        backgroundColor: ColorUtilites.beyaz,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset(
                        'assets/images/MentorWiseLogo.png',
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 70,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginWithMentorWise(),
                          ));
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: ColorUtilites.mavi,
                          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            Image.asset(
                              'assets/images/Screenshot_1.png',
                            ),
                            Text(
                              'MentorWise ile giriş yap',
                              style: TextUtilites().ButtonText.copyWith(fontSize: 18),
                            ),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 145,
                            height: 70,
                            child: Card(
                              elevation: 5,
                              child: Icon(
                                Brandico.facebook_1,
                                color: ColorUtilites.mavi,
                                size: 40,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), side: const BorderSide()),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                            width: 145,
                            height: 70,
                            child: Card(
                              elevation: 5,
                              child: Icon(
                                FontAwesome.google,
                                color: Color(0xffF24E1E),
                                size: 40,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10), side: const BorderSide()),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 125),
              Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20,),
                child: Column(mainAxisAlignment: MainAxisAlignment.end, children: const[
                  Text(
                    'Giriş yaparak, MentorWise’ın Kullanım Koşullarını ve Gizlilik Politikasını kabul etmiş olursunuz.',
                    style: TextStyle(fontSize: 17),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
