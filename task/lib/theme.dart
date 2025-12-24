import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(219, 224, 224, 224),
    foregroundColor: Colors.black, // AppBar 텍스트 색상
    elevation: 0, // 그림자 제거
  ),

  scaffoldBackgroundColor: const Color.fromARGB(255, 178, 178, 178),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black,
    brightness: Brightness.light,
  ),
  dividerColor: Colors.black38,
  highlightColor: Colors.grey,
);
