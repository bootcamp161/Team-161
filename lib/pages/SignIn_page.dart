// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  bool value = false;
  bool readPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/signinlogo.jpg'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Color(0xff1B1A1A),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.iceberg(color: Color(0xffFFFFFF), fontSize: 24),
                        controller: emailEditingController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(
                              Icons.mail_outline,
                              color: Color(0xff000000),
                              size: 40,
                            ),
                            hintText: 'Emailiniz..',
                            hintStyle: GoogleFonts.iceberg(color: Color(0xffFFFFFF), fontSize: 20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: const Color(0xff1B1A1A),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: TextFormField(
                        style: GoogleFonts.iceberg(color: Color(0xffFFFFFF), fontSize: 24),
                        obscureText: readPassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                readPassword ? Icons.visibility_off : Icons.visibility,
                              ),
                              iconSize: 35,
                              color: const Color(0xff000000),
                              onPressed: () {
                                setState(() {
                                  readPassword = !readPassword;
                                });
                              },
                            ),
                            hintText: 'Sifreniz..',
                            hintStyle: GoogleFonts.iceberg(color: const Color(0xffFFFFFF), fontSize: 20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: const Color(0xff1B1A1A),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: TextFormField(
                        style: GoogleFonts.iceberg(color: Color(0xffFFFFFF), fontSize: 24),
                        decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Color(0xff000000),
                              size: 40,
                            ),
                            hintText: 'Kullancı Adınız..',
                            hintStyle: GoogleFonts.iceberg(color: const Color(0xffFFFFFF), fontSize: 20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color(0xff136824),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'KAYIT OL',
                            style: GoogleFonts.iceberg(fontSize: 25, color: const Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      height: 1,
                      width: 140,
                      color: const Color(0xffD3C9C9),
                    ),
                  ),
                  Text(
                    'VEYA',
                    style: GoogleFonts.iceberg(fontSize: 15, color: Color(0xffFFFFFF)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 1,
                      width: 140,
                      color: Color(0xffD3C9C9),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      color: const Color(0xffEA1821),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'GOOGLE ILE KAYIT OL',
                            style: GoogleFonts.iceberg(fontSize: 25, color: Color(0xffFFFFFF)),
                          ),
                        ),
                      ),
                      shape: const StadiumBorder(),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 300,
                    child: ListTile(
                        title: Row(
                          children: [
                            Text('KVKK',
                                style: GoogleFonts.iceberg(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xffFFFFFF),
                                )),
                            Text(' Metnini Kabul Et', style: GoogleFonts.iceberg(color: Color(0xffFFFFFF)))
                          ],
                        ),
                        leading: Checkbox(
                          fillColor: MaterialStateProperty.all<Color>(Colors.white),
                          checkColor: Colors.red,
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  

 
}
