import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'theme/custom_themes.dart';
import 'views/Authentication/signup_page/signup_page_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SignUpPageProvider(),
    );
  }
}
