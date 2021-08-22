import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/styles.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.title,
    this.hasPadding = false,
    this.hasButtonRefreshed = false,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final bool hasPadding;
  final bool hasButtonRefreshed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: hasPadding ? 0 : 30,
        left: hasPadding ? 0 : 30,
        top: 20,
        bottom: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Visibility(
            visible: hasButtonRefreshed,
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(
                CupertinoIcons.refresh_circled,
                color: accentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
