import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/chat_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';
import 'package:mentorwiseasil/widgets/get_mentor_deneyim.dart';

class MentorProfilePage extends StatefulWidget {
  const MentorProfilePage({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  State<MentorProfilePage> createState() => _MentorProfilePageState();
}

class _MentorProfilePageState extends State<MentorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.send),
                color: Colors.black, onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return ChatPage(index: widget.index,);
                },));
                 },
              ),
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.chevron_left, size: 30.sp, color: Colors.black),
            ),
            elevation: 0,
            backgroundColor: ColorUtilites.blue,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 270.h,
                decoration: BoxDecoration(
                  color: ColorUtilites.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(175.r),
                    bottomRight: Radius.circular(175.r),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 160.h,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: 5, color: Color(0xff343994))),
                              child: GetMentorImage(documentId: mentorIDs[widget.index]))),
                      SizedBox(height: 10.h),
                      GetMentorProfileName(documentId: mentorIDs[widget.index]),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      body: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                            child: TabBar(
                                labelColor: const Color(0xff343994),
                                unselectedLabelColor: Colors.black,
                                labelStyle: GoogleFonts.amiri(fontSize: 22.sp),
                                tabs: const [
                                  Tab(text: 'Hakkında'),
                                  Tab(
                                    text: 'Deneyim',
                                  ),
                                  Tab(
                                    text: 'İletişim',
                                  )
                                ]),
                          ),
                          Expanded(
                            child: TabBarView(children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20.0.r),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 10.h),
                                      GetMentorHakkinda(documentId: mentorIDs[widget.index]),
                                      SizedBox(height: 20.h),
                                      GetMentorBeceri(documentId: mentorIDs[widget.index]),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.0.w,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        _25CircleAvatar(),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GetMentorDeneyim(documentId: mentorIDs[widget.index], field: 'deneyim'),
                                              GetMentorDeneyimTarih(
                                                  documentId: mentorIDs[widget.index], tarih: 'deneyim1tarih')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // _10CircleAvatar(),
                                    Row(
                                      children: [
                                        _25CircleAvatar(),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GetMentorDeneyim(documentId: mentorIDs[widget.index], field: 'deneyim2'),
                                              GetMentorDeneyimTarih(
                                                  documentId: mentorIDs[widget.index], tarih: 'deneyim2tarih')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // _10CircleAvatar(),
                                    Row(
                                      children: [
                                        _25CircleAvatar(),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              GetMentorDeneyim(documentId: mentorIDs[widget.index], field: 'deneyim3'),
                                              GetMentorDeneyimTarih(
                                                  documentId: mentorIDs[widget.index], tarih: 'deneyim3tarih')
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.mail),
                                  SizedBox(width: 15.w),
                                  GetMentorContact(documentId: mentorIDs[widget.index])
                                ],
                              ))
                            ]),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          )),
    );
  }

  CircleAvatar _25CircleAvatar() => CircleAvatar(backgroundColor: ColorUtilites.blue, radius: 25.r);

  Row _10CircleAvatar() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0.r),
          child: CircleAvatar(backgroundColor: ColorUtilites.blue, radius: 10.r),
        ),
      ],
    );
  }
}
