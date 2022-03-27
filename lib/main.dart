import 'dart:async';
import '../constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/pages/login_screen.dart';
import 'package:nirvana/pages/main_page.dart';
import 'package:nirvana/pages/registration_screen.dart';
import 'package:nirvana/pages/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Nirvana());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kConstBackgroundColor,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      systemNavigationBarColor: kConstBackgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}

class Nirvana extends StatefulWidget {
  const Nirvana({Key? key}) : super(key: key);

  @override
  State<Nirvana> createState() => _NirvanaState();
}

class _NirvanaState extends State<Nirvana> {

  late StreamSubscription<User?> user;
  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: FirebaseAuth.instance.currentUser != null? MainPage.id : WelcomeScreen.id,
        routes: {
          WelcomeScreen.id : (context) => const WelcomeScreen(),
          MainPage.id : (context) => const MainPage(),
          RegistrationScreen.id : (context) => const RegistrationScreen(),
          LoginScreen.id : (context) => const LoginScreen(),
        }
    );
  }
}


