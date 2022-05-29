import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mentorwiseasil/pages/blog_page.dart';
import 'package:mentorwiseasil/pages/blog_text.dart';
import 'package:mentorwiseasil/pages/chat_page.dart';
import 'package:mentorwiseasil/pages/forgot_password.dart';
import 'package:mentorwiseasil/oldpages/home_page.dart';
import 'package:mentorwiseasil/pages/bottom_navigator.dart';
import 'package:mentorwiseasil/pages/login_page_old.dart';
import 'package:mentorwiseasil/oldpages/welcomePage_old.dart';
import 'package:mentorwiseasil/oldpages/login_page.dart';
import 'package:mentorwiseasil/pages/login_with_mentorwise.dart';
import 'package:mentorwiseasil/pages/register_page.dart';
import 'package:mentorwiseasil/pages/welcome_page.dart';
import 'package:mentorwiseasil/utilities/utils.dart';
import 'package:mentorwiseasil/widgets/appBarWidget.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        
        initialRoute: '/',
        routes: {
          '/start': (context) => const WelcomePage(),
          '/logingeneral':(context) => const LogInPage(),
          '/login':(context) => const LoginWithMentorWise(),
          '/password':(context) => const ForgotPassword(),
          '/register':(context) =>  const RegisterPage(),
          '/home2':(context) => const HomePage1(),
          '/home': (context) => HomePage(),
          '/blog':(context) => BlogPage(),
          '/message':(context) => ChatPage(),
        },
        scaffoldMessengerKey: Utils.messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
        
    
      ),
      designSize: Size(411, 731),
    );
  }
}
