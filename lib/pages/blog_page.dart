import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentorwiseasil/pages/blog_text.dart';
import 'package:mentorwiseasil/pages/login_page_old.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/lists.dart';
import 'package:mentorwiseasil/widgets/get_blog_data.dart';
import 'package:mentorwiseasil/widgets/get_mentor_data.dart';
import 'package:mentorwiseasil/widgets/get_user_name.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key, this.guestUser = false}) : super(key: key);
  final bool guestUser;
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  Future getBlogId() async {
    await FirebaseFirestore.instance.collection('blogs').get().then((snapshot) => snapshot.docs.forEach((element) {
          // print(element.reference);
          blogIDs.add(element.reference.id);
        }));
  }

  List<String> blogIDs = [];

  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          widget.guestUser
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.info,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => const LogInPage(),
                                          ));
                                        },
                                        child: const Text('Giriş Yap'),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Kapat')),
                                    ],
                                  ),
                                ),
                              ],
                              title: const Text(
                                  'Misafir modundasınız, uygulamayı en verimli şekilde kullanmak istiyorsanız giriş yapınız.'),
                            );
                          });
                    },
                  ),
                )
              : const SizedBox(),
        ],
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        title: Text(
          'Okumaya Başla',
          style: baslikStyleBold.copyWith(fontSize: 30),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: getBlogId(),
            builder: (context, snapshot) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return BlogText(
                            index: index,
                            blogIDs: blogIDs,
                          );
                        },
                      ));
                    },
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          children: [GetBlogTitle(documentId: blogIDs[index])],
                        ),
                        GetBlogSummary(documentId: blogIDs[index]),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.r),
                            child: Row(
                              children: [
                                CircleAvatar(radius: 30.r, child: GetBlogImage(documentId: blogIDs[index])),
                                SizedBox(width: 20.w),
                                GetBlogWriter(documentId: blogIDs[index]),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GetBlogMinute(documentId: blogIDs[index]),
                                SizedBox(width: 20.w),
                              ],
                            ),
                          ),
                        ]),
                      ],
                    ),
                  );
                },
                itemCount: blogIDs.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            }),
      ),
    );
  }
}
