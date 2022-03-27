import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:nirvana/constants/constants.dart';
import 'package:nirvana/neon.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  final String title;
  final void Function() onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 200,
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

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Neon(text: title, color: Colors.purple, font: NeonFont.Beon, glowing: true,)
          ),
        ),
      ),
    );
  }
}


