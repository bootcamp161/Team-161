import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';

class GetUserName extends StatelessWidget {

  final String documentId;   

  GetUserName({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Wrap(
          children: [
            Text('${data['name']}', style: baslikStyleBold,),
          ],
        );
      }
      return const Text('loading');
    },);
  }
}


class GetUserEmail extends StatelessWidget {

  final String documentId; 

  GetUserEmail({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
        return Wrap(
          children: [
            Text('${data['mail']}', style: baslikStyleBold,),
          ],
        );
      }
      return const Text('loading');
    },);
  }
}