import 'package:flutter/material.dart';
import 'package:oshop/views/on_board_screen/onboard_screen_one.dart';

import 'theme/custom_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oshop',
      theme: CustomThemes.lightTheme(context),
      home: const OnBoardScreenOne(),
    );
  }
}
