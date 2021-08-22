import 'package:flutter/material.dart';

class TapSlashItem extends StatelessWidget {
  const TapSlashItem({
    Key? key,
    required this.child,
    required this.onPressed,
    this.itemRadius,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onPressed;
  final double? itemRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(itemRadius ?? 0),
          child: InkWell(
            borderRadius: BorderRadius.circular(itemRadius ?? 0),
            onTap: onPressed,
          ),
        ),
      ],
    );
  }
}
