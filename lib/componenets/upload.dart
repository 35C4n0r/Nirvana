import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/componenets/reusable_container.dart';
import 'package:nirvana/componenets/reusable_container2.dart';
import 'package:nirvana/componenets/rounded_button.dart';
import 'package:nirvana/componenets/rounded_button2.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nirvana/constants/constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../neon.dart';
import '../pages/main_page.dart';

class IsOK extends StatefulWidget {
  static String id = 'upload_screen';
  const IsOK({Key? key}) : super(key: key);
  @override
  State<IsOK> createState() => _IsOKState();
}

class _IsOKState extends State<IsOK> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  late String _imagePath = '';
  late String? _imageName = '';
  late String? _audioName = '';
  late String _audioPath = '';
  // Future<void> getImage() async {
  //   late ImagePicker _picker = ImagePicker();
  //   PickedFile? pickedFile;
  //   pickedFile = (await _picker.getImage(source: ImageSource.gallery));
  //   setState(() {
  //     _imagePath = pickedFile!.path;
  //   });
  // }

  Future<void> getAudio() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);
    String? _path = result?.files.first.path;
    if (_path != null) {
      setState(() {
        _audioPath = _path;
        _audioName = (result?.names)![0];
      });
    }
  }
  Future<void> getImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    String? _path = result?.files.first.path;
    if (_path != null) {
      setState(() {
        _imagePath = _path;
        _imageName = (result?.names)![0];
      });
    }
  }

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath, String? type) async {
    File file = File(filePath);

    try {
      await firebase_storage.FirebaseStorage.instance.ref('_here/$type').putFile(file);
      //String downloadURL = await (await uploadTask).ref.getDownloadURL();
    }
    catch(e){
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kConstBackgroundColor,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton2(
                  title: 'Upload Image',
                  onPressed: () {
                    setState(() {
                      getImage();
                    });
                  },
                  color: Colors.white,
                  h: 60,
                  w: 300,
                ),
                RoundedButton2(
                  h: 60,
                  w: 300,
                  title: 'Upload Music',
                  onPressed: () {
                    getAudio();
                  },
                  color: Colors.white,
                ),
                // Container(
                //   height: 100,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.only(
                //       topRight: Radius.circular(0),
                //       bottomLeft: Radius.circular(0),
                //       bottomRight: Radius.circular(30),
                //       topLeft: Radius.circular(30),
                //     ),
                //     color: Color(0xFF1F0E2F),
                //     boxShadow: [
                //       BoxShadow(
                //         color: Color(0xFFB902BB),
                //         blurRadius: 5.0,
                //         spreadRadius: 2.0,
                //       )
                //     ],
                //   ),
                //   child: Row(
                //     children: [
                //       ClipRRect(
                //         borderRadius: kConstBoxRadius,
                //         child: Image.file(
                //           _image,
                //           width: 100,
                //           height: 100,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 20,
                //       ),
                //       Expanded(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Flexible(
                //               child: ListView(
                //                 scrollDirection: Axis.horizontal,
                //                 children: [
                //                   Neon(
                //                     text: '', // TODO implement
                //                     color: Colors.red,
                //                     font: NeonFont.Monoton,
                //                     glowing: true,
                //                     // flickeringText: true,
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Flexible(
                //               child: ListView(
                //                 scrollDirection: Axis.horizontal,
                //                 children: [
                //                   Neon(
                //                     text: 'artistName', // TODO implement this
                //                     color: Colors.red,
                //                     fontSize: 15,
                //                     font: NeonFont.LasEnter,
                //                     glowing: true,
                //                     // flickeringText: true,
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       const SizedBox(
                //         width: 0,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(
                //             right: 8.0, left: 8.0, bottom: 10),
                //         child: Container(
                //           child: IconButton(
                //             onPressed: () {
                //               // if (!pause) {
                //               //   playSound(3);
                //               //   pause = true;
                //               // } else {
                //               //   player.pause();
                //               //   pause = false;
                //               // }
                //             },
                //             icon: const Icon(
                //               Icons.play_arrow_outlined,
                //               color: Colors.deepPurple,
                //             ),
                //           ),
                //           height: 40,
                //           width: 40,
                //           decoration: const BoxDecoration(
                //             color: Color(0xFF1F0E2F),
                //             shape: BoxShape.circle,
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Color(0xFFB902BB),
                //                 blurRadius: 5.0,
                //                 spreadRadius: 2.0,
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                RoundedButton2(
                  title: "Upload",
                  onPressed: () async {
                    await uploadFile(_imagePath, _imageName);
                    await uploadFile(_audioPath, _audioName);
                    print(_imagePath);
                    print(_audioPath);
                  },
                  color: kConstIconColor,
                  h: 60,
                  w: 300,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
