import 'package:flutter/material.dart';

import '../config/theme/styles.dart';
import '../core/utils/color_helper.dart';
import 'tap_slash_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.category,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: ColorHelper.getColorByCategory(category),
      child: TapSlashItem(
        onPressed: onPressed,
        itemRadius: 16,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Icon(
                    Icons.lunch_dining,
                    size: 50,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  category,
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
