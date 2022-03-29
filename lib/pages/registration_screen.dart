import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:nirvana/neon.dart';

import '../componenets/rounded_button.dart';
import '../constants/constants.dart';
import 'login_screen.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  late bool isHidden = true;
  Icon icon = const Icon(
    Icons.cancel,
    color: kConstIconColor,
  );

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
                    child: Neon(text: 'Nirvana', color: Colors.purple, font: NeonFont.Automania, fontSize: 40, glowing: true,)
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecorations.copyWith(
                  hintText: 'Enter your E-mail.',
                ),
                onChanged: (value) {
                  email = value;
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: isHidden,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  password = value;
                  // print(password);
                  if (password.length >= 6) {
                    icon = const Icon(
                      Icons.check,
                      color: Colors.greenAccent,
                    );
                  } else if (password.isEmpty) {
                    icon = const Icon(
                      Icons.cancel,
                      color: kConstIconColor,
                    );
                  } else {
                    icon = const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    );
                  }
                  setState(() {
                    icon;
                  });
                },
                decoration: kTextFieldDecorations.copyWith(
                  hintText: 'Enter your password.',
                  prefixIcon: const Icon(Icons.password_outlined, color: kConstIconColor,),
                  suffixIcon: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // added line
                    mainAxisSize: MainAxisSize.min, // added line
                    children: [
                      icon,
                      IconButton(
                        icon: const Icon(Icons.visibility_outlined, color: kConstIconColor,),
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    Navigator.pushNamed(context, LoginScreen.id);
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    build(context);
                    setState(() {
                      showSpinner = false;
                    });
                    showDialog(
                      context: context,
                      builder: (_) {
                        return AlertWindow(error: e.toString());
                      },
                    );
                  }
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//suffixIcon: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       icon,
//                       IconButton(
//                         icon: const Icon(Icons.visibility_outlined),
//                         onPressed: () {
//                           setState(() {
//                             isHidden = !isHidden;
//                           });
//                         },
//                       ),
//                     ],
//                   )

class AlertWindow extends StatelessWidget {
  const AlertWindow({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AlertDialog(
        title: const Text('Alert'),
        content: Text(error),
      ),
    );
  }
}
