import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/api_constant.dart';
import '../core/data/models/restaurant.dart';
import '../store/bookmark/bookmark_store.dart';
import 'custom_circle_button.dart';
import 'rating_chip.dart';
import 'tap_slash_item.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    Key? key,
    required this.restaurant,
    required this.onPressed,
  }) : super(key: key);
  final Restaurant restaurant;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        children: [
          TapSlashItem(
            onPressed: onPressed,
            itemRadius: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Hero(
                      tag: restaurant.id,
                      child: Image.network(
                        ApiConstant.imageMediumUrl(restaurant.pictureId),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                _buildRestoInfo(context),
              ],
            ),
          ),
          _buildBookmarkButton(),
        ],
      ),
    );
  }

  Widget _buildBookmarkButton() {
    final _bookmark = getIt<BookmarkStore>();
    return Observer(
      builder: (context) => Positioned(
        right: 16,
        top: 8,
        child: CustomCircleButton(
          icon: _bookmark.isBookmarked(restaurant.id)
              ? CupertinoIcons.bookmark_fill
              : CupertinoIcons.bookmark,
          onPressed: () {
            _bookmark.isBookmarked(restaurant.id)
                ? _bookmark.removeBookmark(restaurant.id)
                : _bookmark.addBookmark(restaurant.id);
          },
        ),
      ),
    );
  }

  Widget _buildRestoInfo(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 16,
        left: 16,
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingChip(rating: restaurant.rating),
          Text(
            restaurant.name,
            style: Theme.of(context).textTheme.subtitle1,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(
                CupertinoIcons.map_pin_ellipse,
                size: 18,
                color: accentColor,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  restaurant.city,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
