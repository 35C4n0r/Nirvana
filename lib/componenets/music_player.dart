import 'package:audioplayers/audioplayers.dart';

late AudioCache cache = AudioCache();
late AudioPlayer player;
int count = 0;
int pre = -1;

Future<void> playSound(var wavNumber) async {
  count ++;
  if(count == 1){
    pre = wavNumber;
  }
  else{
    if(pre != wavNumber){
      player.stop();
    }
  }
  player = await cache.play("$wavNumber.mp3");
}

