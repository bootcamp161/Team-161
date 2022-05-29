import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/color_text_utilities1.dart';

class GetMentorName extends StatelessWidget {

  final String documentId; 

  GetMentorName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['name']}', style: baslikStyleBold.copyWith(fontSize: 20.sp),);
      }
      return const Text('loading');
    },);
  }
}

class GetMentorProfileName extends StatelessWidget {

  final String documentId; 

  GetMentorProfileName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['name']}', style: GoogleFonts.amiri(fontSize: 20.sp, fontWeight: FontWeight.bold),);
      }
      return const Text('loading');
    },);
  }
}


class GetMentorHakkinda extends StatelessWidget {

  final String documentId; 

  GetMentorHakkinda({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['hakkinda']}', style: GoogleFonts.amiri(fontSize: 17.sp, color: Colors.black));
      }
      return const Text('loading');
    },);
  }
}

class GetMentorBeceri extends StatelessWidget {

  final String documentId; 

  GetMentorBeceri({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['beceriler']}', style: GoogleFonts.amiri(fontSize: 17.sp, color: Colors.black));
      }
      return const Text('loading');
    },);
  }
}

class GetMentorImage extends StatelessWidget {

  final String documentId; 

  GetMentorImage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        // return widget(child: Text('${data['photoUrl']}', style: baslikStyle.copyWith(fontSize: 15),));
        return Image.network('${data['photoUrl']}', fit: BoxFit.cover,);
      }
      return const Text('loading');
    },);
  }
}

class GetMentorContact extends StatelessWidget {

  final String documentId; 

  GetMentorContact({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['mail']}', style: baslikStyleBold.copyWith(fontSize: 20),);
      }
      return const Text('loading');
    },);
  }
}

