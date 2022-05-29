import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utilities/color_text_utilities1.dart';

class GetBlogSummary extends StatelessWidget {

  final String documentId; 

  GetBlogSummary({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['summary']}', style: baslikStyle.copyWith(fontSize: 15),);
      }
      return const Text('loading');
    },);
  }
}

class GetBlogTitle extends StatelessWidget {

  final String documentId; 

  GetBlogTitle({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Align(
          alignment: Alignment.centerLeft,
          child: Text('${data['title']}', style: baslikStyleBold.copyWith(fontSize: 25),));
      }
      return const Text('loading');
    },);
  }
}

class GetBlogWriter extends StatelessWidget {

  final String documentId; 

  GetBlogWriter({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Wrap(
          children: [
            Text('${data['writername']}', style: baslikStyleBold.copyWith(fontSize: 17.sp),),
          ],
        );
      }
      return const Text('loading');
    },);
  }
}

class GetBlogMinute extends StatelessWidget {

  final String documentId; 

  GetBlogMinute({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['minute']}dk', style: baslikStyleBold.copyWith(fontSize: 18.sp),);
      }
      return const Text('loading');
    },);
  }
}

class GetBlogText extends StatelessWidget {

  final String documentId; 

  GetBlogText({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Align(
          alignment: Alignment.centerLeft,
          child: Text('${data['text']}', style: baslikStyle.copyWith(fontSize: 17.sp),));
      }
      return const Text('loading');
    },);
  }
}

class GetBlogImage extends StatelessWidget {

  final String documentId; 

  GetBlogImage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('blogs');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Image.network('${data['image']}');
      }
      return const Text('loading');
    },);
  }
}