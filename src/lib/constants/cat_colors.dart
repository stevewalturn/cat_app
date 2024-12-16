import 'package:flutter/material.dart';

enum CatColor { orange, black, white, grey, brown, calico }

extension CatColorExtension on CatColor {
  String get name {
    switch (this) {
      case CatColor.orange:
        return 'Orange';
      case CatColor.black:
        return 'Black';
      case CatColor.white:
        return 'White';
      case CatColor.grey:
        return 'Grey';
      case CatColor.brown:
        return 'Brown';
      case CatColor.calico:
        return 'Calico';
    }
  }

  String get emoji {
    switch (this) {
      case CatColor.orange:
        return '🦊';
      case CatColor.black:
        return '🐈‍⬛';
      case CatColor.white:
        return '🐱';
      case CatColor.grey:
        return '😺';
      case CatColor.brown:
        return '🦁';
      case CatColor.calico:
        return '😸';
    }
  }

  Color get color {
    switch (this) {
      case CatColor.orange:
        return Colors.orange;
      case CatColor.black:
        return Colors.black87;
      case CatColor.white:
        return Colors.white;
      case CatColor.grey:
        return Colors.grey;
      case CatColor.brown:
        return Colors.brown;
      case CatColor.calico:
        return Colors.amber;
    }
  }
}
