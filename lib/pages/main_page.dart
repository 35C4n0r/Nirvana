import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nirvana/componenets/reusable_container.dart';
import 'package:nirvana/componenets/upload.dart';
import 'package:nirvana/pages/welcome_screen.dart';
// import 'package:neon/neon.dart';
import '../componenets/rounded_button.dart';
import '../componenets/rounded_button2.dart';
import '../constants/constants.dart';
import '../neon.dart';
import 'package:audioplayers/audioplayers.dart';

import 'login_screen.dart';

// import '../neon.dart';
// final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

void playSound(var wavNumber) {
  final player = AudioCache();
  player.play("music/$wavNumber.mp3");
}

class MainPage extends StatefulWidget {
  static String id = 'main_page';

  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Neon(
                  text: 'NIRVANA',
                  color: Colors.deepPurple,
                  font: NeonFont.Automania,
                  glowing: true,
                  fontSize: 50,
                  flickeringText: true,
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 1,
                  artistName: 'Chainsmokers',
                  songName: 'Somebody Drew Love',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 2,
                  artistName: 'Deemo',
                  songName: 'Endless Dreams',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 3,
                  artistName: 'Rapbit',
                  songName: 'Dreams',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 4,
                  artistName: 'Mii',
                  songName: 'Nine Point Eight',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 5,
                  artistName: 'Coldplay',
                  songName: 'Viva La Vida',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 6,
                  artistName: 'Radwimp',
                  songName: 'Nandemonaiya',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 7,
                  artistName: 'TK',
                  songName: 'Unravel',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 8,
                  artistName: 'Chelsea Cutler',
                  songName: 'Crazier Things',
                ),
                const SizedBox(
                  height: 50,
                ),
                const ReusableContainer(
                  audioNum: 9,
                  artistName: 'Jeramy Zucker & \n Chelsea Cutler',
                  songName: 'Better Off',
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundedButton(
                  title: 'Log Out',
                  onPressed: () {
                    setState(
                      () {
                        Navigator.popAndPushNamed(context, WelcomeScreen.id);
                        _auth.signOut();
                      },
                    );
                  },
                  color: Colors.white,
                ),
                RoundedButton(
                  title: 'Upload',
                  onPressed: () {
                    Navigator.pushNamed(context, IsOK.id);
                    // showDialog(
                    //   context: context,
                    //   builder: (_) {
                    //     return const IsOK();
                    //   },
                    // );
                  },
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// height: 100,
// width: 300,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(0),
// bottomLeft: Radius.circular(0),
// bottomRight: Radius.circular(30),
// topLeft: Radius.circular(30),
// ),
// color: Color(0xFF1F0E2F),
// boxShadow: [
// BoxShadow(
// color: Color(0xFFB902BB),
// blurRadius: 5.0,
// spreadRadius: 2.0,
// )
// ],
// ),
