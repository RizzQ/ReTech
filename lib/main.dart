import 'package:flutter/material.dart';
import 'package:retech/screens/OnboardingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ReTech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: OnboardingScreeen()
    );
  }
}
