import 'package:flutter/material.dart';
import 'package:hackademy/palette.dart';

final hackademyTheme = ThemeData(
    primaryColor: Palette.black,
    primarySwatch: Colors.blue,
    dividerColor: Palette.yellow,
    fontFamily: 'Mono',
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) return Palette.lilla;
        return Palette.lilla;
      }),
    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: Colors.white54,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      shadows: [
        Shadow(
          color: Palette.lilla,
          blurRadius: 10.0,
        ),
        Shadow(
          color: Palette.lilla,
          blurRadius: 10.0,
        ),
        Shadow(
          color: Palette.lilla,
          blurRadius: 10.0,
        ),
        Shadow(
          color: Palette.lilla,
          blurRadius: 10.0,
        ),
      ],
    ));
