import 'package:flutter/material.dart';
import 'package:hackademy/palette.dart';

class BodyText extends StatelessWidget {
  const BodyText(this.text,
      {super.key, this.fontSize = 15, this.disabled = false});

  final String text;
  final double fontSize;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final color = disabled ? Colors.grey : Palette.lilla;
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = fontSize * 2.5 / 20
              ..color = color,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            shadows: disabled
                ? []
                : [
                    Shadow(
                      color: color,
                      blurRadius: fontSize * 1.5,
                    ),
                    Shadow(
                      color: color,
                      blurRadius: fontSize * 1.5,
                    ),
                    Shadow(
                      color: color,
                      blurRadius: fontSize * 1.5,
                    ),
                    Shadow(
                      color: color,
                      blurRadius: fontSize * 1.5,
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
