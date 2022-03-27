import 'package:flutter/material.dart';
// import 'package:neon/neon.dart';
import 'package:nirvana/constants/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import '../neon.dart';
import 'music_player.dart';


class ReusableContainer extends StatefulWidget {
  final String songName;
  final String artistName;
  final int audioNum;
  const ReusableContainer({Key? key, required this.audioNum, required this.songName, required this.artistName}) : super(key: key);

  @override
  State<ReusableContainer> createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  late int audioNum = widget.audioNum;
  late String songName = widget.songName;
  late String artistName = widget.artistName;


  late bool newSong = false;
  late bool pause = false;
  late int pre;
  late bool glow = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glow = true;
  }


    @override
    Widget build(BuildContext context) {
      return Container(
        height: 100,
        width: 300,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
          color: Color(0xFF1F0E2F),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFB902BB),
              blurRadius: 5.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: kConstBoxRadius,
              child: Image.asset(
                'images/$audioNum.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [Neon(
                        text: songName,
                        // fontSize: 25,
                        color: Colors.red,
                        font: NeonFont.Monoton,
                        glowing: glow,
                        // flickeringText: true,
                      ),]
                    ),
                  ),
                  Flexible(
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [Neon(
                        text: artistName,
                        color: Colors.red,
                        fontSize: 15,
                        font: NeonFont.LasEnter,
                        glowing: glow,
                        // flickeringText: true,
                      ),]
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(right:  8.0, left: 8.0, bottom: 10),
              child: Container(
                child: IconButton(
                  onPressed: () {
                    if (!pause){
                      playSound(audioNum);
                      pause = true;
                    }
                    else{
                      player.pause();
                      pause = false;
                    }
                  },
                  icon: const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.deepPurple,
                  ),
                ),
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF1F0E2F),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFB902BB),
                      blurRadius: 5.0,
                      spreadRadius: 2.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}
