// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_solid_test/constants/app_constants.dart';

//Page with random color generation
class HiTherePage extends StatefulWidget {
  const HiTherePage({super.key});

  @override
  State<HiTherePage> createState() => _HiTherePageState();
}

class _HiTherePageState extends State<HiTherePage> {
  final Random _random = Random();

  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;

  void changeColor() {
    final int r = _random.nextInt(AppConstants.maxColorInt);
    final int g = _random.nextInt(AppConstants.maxColorInt);
    final int b = _random.nextInt(AppConstants.maxColorInt);

    // Luminance formula for brightness computing
    final double brightness = (AppConstants.rBrightIdx * r) +
        (AppConstants.gBrightIdx * g) +
        (AppConstants.bBrightIdx * b);

    setState(() {
      _backgroundColor = Color.fromARGB(
        _random.nextInt(AppConstants.maxColorInt),
        r,
        g,
        b,
      );
      _textColor = brightness > AppConstants.brightnessDivider
          ? Colors.black
          : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            AppConstants.hiThere,
            style: TextStyle(
              color: _textColor,
              fontSize: AppConstants.textSize,
            ),
          ),
        ),
      ),
    );
  }
}
