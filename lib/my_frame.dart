import 'package:flutter/material.dart';

import 'my_canvas.dart';

class MyFrame extends StatelessWidget {
  const MyFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Demo Frame'),
      ),
      body: const MyCanvas(),
    );
  }
}
