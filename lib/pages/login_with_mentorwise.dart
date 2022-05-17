import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/utilities/color_text_utilities1.dart';
import 'package:mentorwiseasil/utilities/icon_utilities.dart';

class LoginWithMentorWise extends StatefulWidget {
  const LoginWithMentorWise({Key? key}) : super(key: key);

  @override
  State<LoginWithMentorWise> createState() => _LoginWithMentorWiseState();
}

class _LoginWithMentorWiseState extends State<LoginWithMentorWise> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordRead = true;

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

  void stateListener() => setState(() {
    
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorUtilites.beyaz,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
              icon: backButton(),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                primary: false,
                child: Center(
                  child: Column(
                    children: [
                      AutofillGroup(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            logoWidget(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: emailWidget(),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: passwordWidget(),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: girisYap(),
                            ),
                            const SizedBox(height: 10),
                            parolamiUnuttum(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 80),
                      Column(
                        children: [kaydol()],
                      )
                    ],
                  ),
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
      onTap: () {},
      child: Text(
        'Hesabınız mı yok? Şimdi Kaydolun.',
        style:
            GoogleFonts.inriaSans(color: const Color(0xff424242), fontSize: 20, decoration: TextDecoration.underline),
      ),
    );
  }

  InkWell parolamiUnuttum() {
    return InkWell(
      onTap: () {},
      child: Text(
        'Parolanızı mı unuttunuz?',
        style: GoogleFonts.inriaSans(color: const Color(0xff5E5E5E), fontSize: 18),
      ),
    );
  }

  InkWell girisYap() {
    return InkWell(
      onTap: () {
        final form = formKey.currentState!;

        if (form.validate()) {
          TextInput.finishAutofillContext();
        }
      },
      child: SizedBox(
        height: 60,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: ColorUtilites.mavi,
          child: Center(
            child: Text(
              'Giriş Yap',
              style: TextUtilites().ButtonText.copyWith(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField passwordWidget() {
    return TextFormField(
      validator: (password) => password != null && password.length < 5
      ? 'Parolanız en az 5 karekter olmalıdır'
      : null,
      autofillHints: [AutofillHints.password],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      obscureText: passwordRead,
      controller: _passwordController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff878787)),
            borderRadius: BorderRadius.circular(10),
          ),
          // errorText: 'Parola yanlış',
          labelText: 'Parola',
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  passwordRead = !passwordRead;
                });
              },
              icon: passwordRead
                  ? Icon(Icons.visibility_off, color: Colors.grey[600])
                  : Icon(Icons.visibility, color: Colors.grey[600])),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelStyle: GoogleFonts.inriaSans(fontSize: 18, color: Colors.grey[600])),
    );
  }

  TextFormField emailWidget() {
    return TextFormField(
      validator: (email) => email != null && !EmailValidator.validate(email) ? 'Geçerli bir e-posta giriniz' : null,
      autofillHints: [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff878787)),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'E-Posta',
        suffixIcon: _emailController.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  _emailController.clear();
                },
              ),
        labelStyle: GoogleFonts.inriaSans(fontSize: 18, color: Colors.grey[600]),
      ),
    );
  }
}

class logoWidget extends StatelessWidget {
  const logoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(
        'assets/images/MentorWiseLogo.png',
      ),
    );
  }
}
