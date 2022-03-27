import 'package:flutter/material.dart';

const BorderRadius kConstBoxRadius = BorderRadius.only(
  topRight: Radius.circular(0),
  bottomLeft: Radius.circular(0),
  bottomRight: Radius.circular(30),
  topLeft: Radius.circular(30),
);

// const kconstBackgroundColor =

const kTextFieldDecorations = InputDecoration(
  //border: UnderlineInputBorder(),
  //disabledBorder: InputBorder.none,
  prefixIcon: Icon(Icons.email_outlined,color: Color(0xFFB10455),),
  hintText: 'Enter your email',
  hintStyle: TextStyle(
    color: kConstIconColor,
    // backgroundColor: Colors.white
  ),
);


const kConstIconColor = Color(0xFFB10455);

const kConstBackgroundColor = Color(0xFF1F0E2F);