import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/icon_utilities.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool newMessage = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.of(context).pop();
            },
            icon: backButton(),
          ),
          centerTitle: true,
          title: Text(
            'Mesajlar',
            style: GoogleFonts.abhayaLibre(fontSize: 35.sp, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Center(
            child: Column(
              children: [
                aramaCubugu(),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                              ),
                              SizedBox(
                                width: 40.w,
                              ),
                              Expanded(
                                  child: Container(
                                      // color: Colors.blue,
                                      child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Yazar İsmi',
                                      style: GoogleFonts.abhayaLibre(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Text('Mesleği'),
                                ],
                              ))),
                              SizedBox(
                                width: 30.w,
                              ),
                              if (newMessage) Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.red,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Yeni Mesaj'),
                                      )) else const SizedBox(),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text('5dk önce')
                            ],
                          ),
                        ),
                      );
                    }),
                    itemCount: 5,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container aramaCubugu() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Color(0xffE2E2E2),
      ),
      child: Padding(
        padding: EdgeInsets.all(9.0.r),
        child: const Align(alignment: Alignment.centerRight, child: Icon(Icons.search)),
      ),
    );
  }
}
