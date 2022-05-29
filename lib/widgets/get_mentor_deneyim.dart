import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/color_text_utilities1.dart';

class GetMentorDeneyim extends StatelessWidget {
  final String field;
  final String documentId; 

  GetMentorDeneyim({required this.documentId, required this.field});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['$field']}', style: GoogleFonts.amiri(fontSize: 17.sp, color: Colors.black));
      }
      return const Text('loading');
    },);
  }
}
class GetMentorDeneyimTarih extends StatelessWidget {

  final String tarih;
  final String documentId; 

  GetMentorDeneyimTarih({required this.documentId, required this.tarih});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('mentors');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Text('${data['$tarih']}', style: GoogleFonts.robotoSlab(fontSize: 15.sp, color: Color(0xffB4B4B4)));
      }
      return const Text('loading');
    },);
  }
}
