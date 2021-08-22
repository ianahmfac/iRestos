import 'package:flutter/material.dart';

import '../../config/theme/styles.dart';

class ColorHelper {
  static Color getColorByCategory(String category) {
    switch (category) {
      case 'Jawa':
        return accentColor;
      case 'Sop':
        return Colors.amber;
      case 'Bali':
        return Colors.blue;
      case 'Modern':
        return Colors.pink;
      case 'Sunda':
        return Colors.purple;
      case 'Spanyol':
        return Colors.brown;
      case 'Italia':
        return Colors.teal;
      default:
        return accentColor;
    }
  }
}
