import 'package:flutter/material.dart';

import 'my_frame.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Animation',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyFrame(),
    );
  }
}
