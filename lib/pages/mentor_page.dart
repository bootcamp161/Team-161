import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorwiseasil/pages/mentor_profile.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';

class MentorPage extends StatefulWidget {
  const MentorPage({Key? key}) : super(key: key);

  @override
  State<MentorPage> createState() => _MentorPageState();
}

class _MentorPageState extends State<MentorPage> {
  Future getMentorId() async {
    await FirebaseFirestore.instance.collection('mentors').get().then((snapshot) => snapshot.docs.forEach((element) {
          mentorIDs.add(element.reference.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Mentorler',
          style: baslikStyleBold.copyWith(fontSize: 30.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0.r),
        child: FutureBuilder(
            // future: getMentorId(),
            builder: (context, snapshot) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MentorProfilePage(
                        index: index,
                        // mentorIDs: mentorIDs,
                      );
                    },
                  ));
                },
                child: ListTile(
                  leading: SizedBox(
                    width: 75.w,
                    child: GetMentorImage(documentId: mentorIDs[index])),
                  trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.chevron_right)),
                  title: GetMentorName(documentId: mentorIDs[index]),
                ),
              );
            },
            itemCount: mentorIDs.toList().toSet().length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider();
            },
          );
        }),
      ),
    );
  }
}
