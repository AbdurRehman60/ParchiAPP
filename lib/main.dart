import 'package:flutter/material.dart';

import 'package:parchi_app/onboarding/Getstarted.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Majlis Nearby',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: Onboarding());
  }
}
