import 'package:flutter/material.dart';

import 'package:xylophone/quizzler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quizz',
      theme: ThemeData.dark(useMaterial3: true),
      home: Quizzler());
  }
}


