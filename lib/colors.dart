

import 'dart:math';

import 'package:flutter/material.dart';

class AppColors{
  static List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.grey,
  ];


static Color getRandom() {
  return colors[Random().nextInt(colors.length)];
}

  
}