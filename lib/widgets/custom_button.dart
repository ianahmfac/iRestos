import 'package:flutter/material.dart';

import '../config/theme/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.textSize,
    this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color ?? accentColor,
          textStyle: TextStyle(fontSize: textSize ?? 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
