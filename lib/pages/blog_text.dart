import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentorwiseasil/widgets/get_blog_data.dart';

import '../utilities/icon_utilities.dart';
import '../utilities/lists.dart';

class BlogText extends StatefulWidget {
  final int index;
  final List blogIDs;
  const BlogText({Key? key, required this.index, required this.blogIDs}) : super(key: key);

  @override
  State<BlogText> createState() => _BlogTextState();
}



class _BlogTextState extends State<BlogText> {

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: backButton(),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    GetBlogTitle(
                      documentId: widget.blogIDs[widget.index],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBlogText(documentId: widget.blogIDs[widget.index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
