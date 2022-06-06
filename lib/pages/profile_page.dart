import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mentorwiseasil/pages/settings_page.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/services/firebase_api.dart';
import 'package:mentorwiseasil/widgets/get_user_name.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then((snapshot) => snapshot.docs.forEach((element) {
          // print(element.reference);
          docIDs.add(element.reference.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SettingsPage();
                    },
                  ));
                },
                icon: Icon(Icons.settings))
          ],
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
              child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            SizedBox(height: 200.h, child: Image.asset('assets/images/user_profile.png')),
                            // SizedBox(height: 5.h)
                            Text('${user.displayName}', style: baslikStyle,)
                          ],
                        );
                      },
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('${user.email}')),
           
          ],
        ));
  }
}
