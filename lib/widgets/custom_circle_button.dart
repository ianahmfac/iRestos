import 'package:flutter/material.dart';

import '../config/theme/styles.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.buttonSize,
    this.backgroundColor,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback onPressed;
  final double? buttonSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: backgroundColor ?? accentColor,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: buttonSize ?? 40,
            height: buttonSize ?? 40,
            child: Icon(
              icon,
              color: iconColor ?? primaryColor,
              size: iconSize ?? 20,
            ),
          ),
        ),
      ),
    );
  }
}
