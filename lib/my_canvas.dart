import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'my_polygon.dart';

class MyCanvas extends StatefulWidget {
  const MyCanvas({super.key});

  @override
  State<MyCanvas> createState() => _MyCanvasState();
}

class _MyCanvasState extends State<MyCanvas> {
  final List<MyPolygon> _polygonList = [];
  final _totalPolygon = Random().nextInt(24) + 12;

  void _addPolygon() {
    _polygonList.clear();

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    for (int i = 0; i < _totalPolygon; i++) {
      final radius = Random().nextInt(width ~/ 4);
      final radian = Random().nextInt(pi.toInt() + 0);
      final left = Random().nextInt((width - radius).toInt()) + radius ~/ 2;
      final top = Random().nextInt((height - radius).toInt()) + radius ~/ 2;

      _polygonList.add(
        MyPolygon(
          left: left,
          top: top,
          radius: radius,
          radian: radian,
        ),
      );
    }

    setState(() {});
  }

  Future<void> handleTimer() async {
    await Future.delayed(const Duration(seconds: 1))
        .then((value) => _addPolygon());
    Timer.periodic(const Duration(seconds: 6), (_) => _addPolygon());
  }

  @override
  void initState() {
    handleTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _polygonList
          .map<Widget>(
            (e) => Positioned(
              left: e.left.toDouble(),
              top: e.top.toDouble(),
              child: e,
            ),
          )
          .toList(),
    );
  }
}
