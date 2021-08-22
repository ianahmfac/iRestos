import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/styles.dart';

class RatingChip extends StatelessWidget {
  const RatingChip({
    Key? key,
    required this.rating,
  }) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: -4,
      ),
      backgroundColor: accentColor.withOpacity(0.2),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.star_fill,
            size: 12,
            color: accentColor,
          ),
          SizedBox(width: 4),
          Text(
            '$rating',
            style: Theme.of(context)
                .textTheme
                .overline
                ?.copyWith(color: accentColor),
          ),
        ],
      ),
    );
  }
}
