import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/card_utilites.dart';
import '../utilities/color_text_utilities1.dart';
import '../utilities/icon_utilities.dart';
import '../widgets/appBarWidget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordRead = true;

  @override
  void initState() {
    super.initState();

    _emailController.addListener(stateListener);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailController.removeListener(stateListener);
    super.dispose();
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
          appBar: logAndSignInAppBar(context),
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
                            child: girisYap(),
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

  InkWell kaydol() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterPage(),
        ));
      },
      child: Text(
        'Hesabınız mı yok? Şimdi Kaydolun.',
        style: GoogleFonts.inriaSans(
            color: const Color(0xff424242), fontSize: 20.sp, decoration: TextDecoration.underline),
      ),
    );
  }

  InkWell parolamiUnuttum() {
    return InkWell(
      onTap: () {},
      child: Text(
        'Parolanızı mı unuttunuz?',
        style: GoogleFonts.inriaSans(color: const Color(0xff5E5E5E), fontSize: 18.sp),
      ),
    );
  }

  InkWell girisYap() {
    return InkWell(
      onTap: () {
        final form = _formKey.currentState!;
        FocusManager.instance.primaryFocus?.unfocus();

        if (form.validate()) {
          TextInput.finishAutofillContext();
        }
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
      validator: (password) => password != null && password.length < 5 ? 'Parolanız en az 5 karekter olmalıdır' : null,
      obscureText: _passwordRead,
      controller: _passwordController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: ColorUtilites.black), borderRadius: borderRadiusC),
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
