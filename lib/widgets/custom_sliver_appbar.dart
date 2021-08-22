import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../core/constants/api_constant.dart';
import '../core/data/models/restaurant.dart';
import '../store/bookmark/bookmark_store.dart';
import 'custom_circle_button.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  CustomSliverAppBar({
    required this.restaurant,
    required this.maxHeight,
    required this.toolbarHeight,
    required this.bookmarkStore,
  });
  final Restaurant restaurant;
  final double maxHeight;
  final double toolbarHeight;
  final BookmarkStore bookmarkStore;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      children: [
        _buildImage(shrinkOffset),
        _buildActionButton(shrinkOffset, context),
        _buildAppBar(shrinkOffset),
      ],
    );
  }

  Widget _buildImage(double shrinkOffset) {
    return Opacity(
      opacity: 1 - shrinkOffset / maxHeight,
      child: Hero(
        tag: restaurant.id,
        child: Image.network(
          ApiConstant.imageMediumUrl(restaurant.pictureId),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildActionButton(double shrinkOffset, BuildContext context) {
    return Opacity(
      opacity: 1 - shrinkOffset / maxHeight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 8,
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: CustomCircleButton(
                  icon: CupertinoIcons.chevron_back,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              FittedBox(
                child: Observer(
                  builder: (context) => CustomCircleButton(
                    icon: bookmarkStore.isBookmarked(restaurant.id)
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    onPressed: () {
                      bookmarkStore.isBookmarked(restaurant.id)
                          ? bookmarkStore.removeBookmark(restaurant.id)
                          : bookmarkStore.addBookmark(restaurant.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(double shrinkOffset) {
    return Visibility(
      visible: shrinkOffset / maxHeight != 0.0,
      child: Opacity(
        opacity: shrinkOffset / maxHeight,
        child: AppBar(
          title: Text(restaurant.name),
          actions: [
            Observer(
              builder: (context) => IconButton(
                onPressed: () {
                  bookmarkStore.isBookmarked(restaurant.id)
                      ? bookmarkStore.removeBookmark(restaurant.id)
                      : bookmarkStore.addBookmark(restaurant.id);
                },
                icon: Icon(bookmarkStore.isBookmarked(restaurant.id)
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => toolbarHeight + 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
