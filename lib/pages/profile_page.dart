import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorwiseasil/pages/mentor_profile.dart';
import 'package:mentorwiseasil/services/firebase_api.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/firebase_file.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';

import '../services/storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('mentors').get().then((snapshot) => snapshot.docs.forEach((element) {
          mentorIDs.add(element.reference.id);
        }));
  }

  // List<String> mentorIDs = [];

  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('files/');
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
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Hata'),
                );
              } else {
                final files = snapshot.data!;

                return ListView.builder(
                  itemCount: files.length,
                  itemBuilder: (context, index) {
                    final file = files[index];

                    return buildFile(context, file);
                  },
                );
              }
          }
        },
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: Image.network(file.url),
        title: InkWell(
          onTap: () {
            print('${file.url}');
          },
          child: Text(
            file.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              color: Colors.blue,
            ),
          ),
        ),
      );
}
