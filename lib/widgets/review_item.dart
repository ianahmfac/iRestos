import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/theme/styles.dart';
import '../core/data/models/review.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    Key? key,
    required this.review,
  }) : super(key: key);

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: ListTile(
          leading: Icon(
            CupertinoIcons.person_crop_circle_fill,
            size: 50,
            color: accentColor,
          ),
          title: Text(
            '"${review.review}"',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              text: '- ${review.name} -\n',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                  text: '${review.date}',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
