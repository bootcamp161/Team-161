import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mentorwiseasil/widgets/firebase_file.dart';

class FirebaseApi {

  final user = FirebaseAuth.instance.currentUser!;
  static Future<List<String>> _getDowlandLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());

  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final results = await ref.listAll();

    final urls = await _getDowlandLinks(results.items);

    return urls
        .asMap()
        .map((index, url) {
          final ref = results.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }
}
