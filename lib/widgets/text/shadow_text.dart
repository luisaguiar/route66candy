/// https://stackoverflow.com/questions/44303882/how-to-add-shadow-to-the-text-in-flutter
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShadowText extends StatelessWidget {
  final String text;
  final TextStyle style;

  const ShadowText({Key? key, required this.text, required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          Positioned(
            top: 2.0,
            left: 2.0,
            child: Text(
              text,
              style: style.copyWith(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: Text(
              text,
              style: style,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
