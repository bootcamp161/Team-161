import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/oldpages/home_page.dart';
import 'package:mentorwiseasil/pages/login_with_mentorwise.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../main.dart';
import '../utilities/card_utilites.dart';
import '../utilities/color_text_utilities1.dart';
import '../utilities/icon_utilities.dart';
import '../widgets/appBarWidget.dart';
import 'bottom_navigator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _passwordRead = true;
  String _error = '';

  @override
  void initState() {
    super.initState();

    _emailController.addListener(stateListener);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailController.removeListener(stateListener);
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  Future userDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
  }

  void stateListener() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtilites.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginWithMentorWise()), (route) => false);
              },
              icon: backButton(),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              primary: false,
              child: Center(
                child: Column(
                  children: [
                    AutofillGroup(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LogoWidget(),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                            child: nameWidget(),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                            child: emailWidget(),
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                            child: passwordWidget(),
                          ),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: kayitOl(),
                          ),
                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField nameWidget() {
    return TextFormField(
      // validator: (email) => email != null && !EmailValidator.validate(email) ? 'Geçerli bir e-posta giriniz' : null,
      autofillHints: const [AutofillHints.email],
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      controller: _nameController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtilites.textFieldBorderColor),
          borderRadius: borderRadiusC,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtilites.black),
          borderRadius: borderRadiusC,
        ),
        labelText: 'İsim',
        labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey[600]),
      ),
    );
  }

  InkWell kayitOl() {
    return InkWell(
      onTap: () {
        signUpMethod();
        // signUp();
        // final form = _formKey.currentState!;
        FocusManager.instance.primaryFocus?.unfocus();

        // if (form.validate()) {
        //   TextInput.finishAutofillContext();
        //   form.save();
        // }
      },
      child: SizedBox(
        height: 60.h,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: borderRadiusC),
          color: ColorUtilites.blue,
          child: Center(
            child: Text(
              'Hesap Oluştur',
              style: TextUtilites().ButtonText.copyWith(fontSize: 22.sp),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField passwordWidget() {
    return TextFormField(
      validator: (password) => password != null && password.length < 6 ? 'Parolanız en az 6 karekter olmalıdır' : null,
      obscureText: _passwordRead,
      controller: _passwordController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtilites.black),
            borderRadius: borderRadiusC,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorUtilites.textFieldBorderColor),
            borderRadius: borderRadiusC,
          ),
          // errorText: 'Parola yanlış',
          labelText: 'Parola',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _passwordRead = !_passwordRead;
                });
              },
              icon: _passwordRead ? iconVisibOff() : iconVisibOn()),
          errorBorder: OutlineInputBorder(borderRadius: borderRadiusC),
          labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey[600])),
    );
  }

  TextFormField emailWidget() {
    return TextFormField(
      validator: (email) => email != null && !EmailValidator.validate(email) ? 'Geçerli bir e-posta giriniz' : null,
      autofillHints: const [AutofillHints.email],
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtilites.textFieldBorderColor),
          borderRadius: borderRadiusC,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorUtilites.black),
          borderRadius: borderRadiusC,
        ),
        labelText: 'E-Posta',
        suffixIcon: _emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: iconClear(),
                onPressed: () {
                  _emailController.clear();
                },
              ),
        labelStyle: GoogleFonts.inriaSans(fontSize: 18.sp, color: Colors.grey[600]),
      ),
    );
  }

  Future signUpMethod() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      userDetails(_nameController.text.trim(), _emailController.text.trim());
      FirebaseAuth.instance.currentUser!.updateDisplayName(_nameController.text);

    } on FirebaseAuthException catch (e) {
      userDetails(_nameController.text.trim(), _emailController.text.trim());

      print(e);
      setState(() {
        _error = '${e.message}';
      });
      Utils.showSnackBar(e.message);
    }

    _error.length > 1
        ? navigatorKey.currentState!.popAndPushNamed('/register')
        : navigatorKey.currentState!
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }

  Future signUpOld() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ));
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            )
            .whenComplete(() => Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage1()), (route) => false));
      } on FirebaseAuthException catch (error) {
        print(error.message);
        print('hata');
        AlertDialog(
          title: Text('${error.message}'),
        );
        Utils.showSnackBar(error.message);
      }
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
      // navigatorKey.currentState!
      //     .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
    }
  }
}

class LogoWidget extends StatelessWidget {
  final logoUrl = 'assets/images/MentorWiseLogo.png';

  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: Image.asset(
        logoUrl,
      ),
    );
  }
}
