import 'package:flutter/material.dart';
import 'package:mentorwiseasil/pages/delete_account.dart';
import 'package:mentorwiseasil/pages/forgot_password.dart';
import 'package:mentorwiseasil/pages/forgot_password_inside.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';

import 'change_email.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ayarlar', style: baslikStyle.copyWith(fontSize: 35),),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: backButton()),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const ChangeEmailPage();
                  },));
                },
                title: const Text('E-posta güncelle'),
              ),
            ),
             Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return const ForgotPassword2();
                  },));
                },
                title: const Text('Şifre değiştir'),
              ),
            ),
             Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return DeleteAccount();
                  },));
                },
                title: Text('Hesabı sil'),
              ),
            )
          ],
        ),
      ),
    );
  }
}