import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nirvana/pages/main_page.dart';

import '../componenets/auth_helper.dart';
import '../componenets/rounded_button.dart';
import '../constants/constants.dart';
import '../neon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  dynamic password;
  bool showSpinner = false;
  late bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstBackgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Neon(text: 'Nirvana', color: Colors.purple, font: NeonFont.Automania, fontSize: 40,)
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: kTextFieldDecorations,
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                style: const TextStyle(color: Colors.white),
                obscureText: isHidden,
                //obscuringCharacter: "*",
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecorations.copyWith(
                    hintText: 'Enter your password.',
                    prefixIcon: const Icon(Icons.password_outlined, color: kConstIconColor,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility_outlined, color: kConstIconColor,),
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                    )),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Log In',
                onPressed: () {
                  setState(() {
                    showSpinner = true;
                  });
                  AuthenticationHelper()
                      .signIn(email: email, password: password)
                      .then(
                        (result) {
                      if (result == null) {
                        Navigator.pushNamed(context, MainPage.id);
                        setState(() {
                          showSpinner = false;
                        });
                      } else {
                        setState(() {
                          showSpinner = false;
                        });
                        print(result);
                      }
                    },
                  );
                },
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
