// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:file_picker/file_picker.dart';
//
//
// void selectimage() async{
//   FilePickerResult? image = await FilePicker.platform.pickFiles();
//     imagefilepath=basename(image.path);
//     uploadImageFile(image?.readAsBytesSync(),imagefilepath);
// }
//
// Future<String> uploadImageFile(List<int> imagefile,String imagefilename) async{
//   ref=FirebaseStorage.instance.ref().child(imagefilename);
//   StorageUploadTask uploadTask=ref.putData(imagefile);
//   imagedownurl=await (await uploadTask.onComplete).ref.getDownloadURL();
//   return "success";
// }
//
// void selectfile() async{
//   FilePickerResult? file = await FilePicker.platform.pickFiles();
//   setState(() {
//     file=file;
//     filename=basename(file.path);
//   });
//   uploadSongFile(file.readAsBytesSync(),filename);
// }
//
// Future<String> uploadSongFile(List<int> file,String filename) async{
//   ref=FirebaseStorage.instance.ref().child(filename);
//   StorageUploadTask uploadTask = ref.putData(file);
//   downurl=await (await uploadTask.onComplete).ref.getDownloadURL();
//   return "success";
// }
//
// void finalupload(){
//   var data = {
//     "song_name":songnameController.text,
//     "artist_name":artistnameController.text,
//     "song_url":downurl.toString(),
//     "image_url":imagedownurl.toString(),
//   };
//   firestoreinstance.collection("songs").document().setData(data);
// }