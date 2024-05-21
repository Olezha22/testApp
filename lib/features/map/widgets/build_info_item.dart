import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget buildInfoItem(String label, String value) {
  return ListTile(
    title: AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        TyperAnimatedText(
          label,
          textStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          speed: const Duration(milliseconds: 200),
        ),
      ],
    ),
    subtitle: AnimatedTextKit(
      isRepeatingAnimation: false,
      animatedTexts: [
        ColorizeAnimatedText(value,
            textStyle: const TextStyle(
              fontSize: 16,
            ),
            speed: const Duration(milliseconds: 500),
            colors: [
              Colors.grey.shade700,
              Colors.blue,
              Colors.transparent,
            ]),
      ],
    ),
  );
}
