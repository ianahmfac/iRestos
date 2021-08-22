import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../core/data/models/restaurant_detail.dart';
import '../core/utils/color_helper.dart';
import '../store/bookmark/bookmark_store.dart';
import '../store/detail/detail_store.dart';
import '../widgets/custom_sliver_appbar.dart';
import '../widgets/menu_expansion.dart';
import '../widgets/rating_chip.dart';
import '../widgets/state_info.dart';
import '../widgets/title_section.dart';
import 'review_page.dart';

class DetailRestaurant extends StatefulWidget {
  static const routeName = '/detail-restaurant';
  const DetailRestaurant({
    Key? key,
    required this.restaurant,
  }) : super(key: key);
  final Restaurant restaurant;

  @override
  _DetailRestaurantState createState() => _DetailRestaurantState();
}

class _DetailRestaurantState extends State<DetailRestaurant> {
  final _detailStore = getIt<DetailStore>();

  void _goToReview() {
    Navigator.pushNamed(context, ReviewPage.routeName,
        arguments: widget.restaurant);
  }

  @override
  void initState() {
    super.initState();
    _detailStore.fetchDetailRestaurant(widget.restaurant.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: accentColor,
        onRefresh: () =>
            _detailStore.fetchDetailRestaurant(widget.restaurant.id),
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: _contentBody(context),
        ),
      ),
    );
  }

  List<Widget> _contentBody(BuildContext context) {
    return [
      _buildAppBar(context),
      SliverToBoxAdapter(
        child: SingleChildScrollView(
          primary: false,
          child: Observer(
            builder: (_) {
              switch (_detailStore.networkState) {
                case NetworkState.Initialize:
                  return Center(
                    child: CupertinoActivityIndicator(),
                  );
                case NetworkState.Loaded:
                  final detail = _detailStore.restaurantDetail;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.restaurant.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        _buildRatingAndCity(context),
                        Text(detail!.address),
                        TextButton.icon(
                          onPressed: _goToReview,
                          icon: Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                          label: Text(
                            'Reviews (${detail.customerReviews.length})   >',
                          ),
                          style: TextButton.styleFrom(
                              primary: accentColor, textStyle: TextStyle()),
                        ),
                        Divider(),
                        TitleSection(
                          title: 'Menus',
                          hasPadding: true,
                        ),
                        MenuExpansion(
                          title: 'Foods',
                          imageAsset: 'assets/images/food.png',
                          subtitle: '${detail.menus.foods.length} items',
                          items: detail.menus.foods,
                        ),
                        MenuExpansion(
                          title: 'Drinks',
                          imageAsset: 'assets/images/drink.png',
                          subtitle: '${detail.menus.drinks.length} items',
                          items: detail.menus.drinks,
                        ),
                        Divider(),
                        TitleSection(
                          title: 'Categories',
                          hasPadding: true,
                        ),
                        _buildCategory(detail),
                        Divider(),
                        TitleSection(
                          title: 'Description',
                          hasPadding: true,
                        ),
                        Text(
                          widget.restaurant.description,
                          style: TextStyle(color: Colors.black54),
                          textAlign: TextAlign.justify,
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  );
                case NetworkState.Error:
                  return StateInfo(
                    title: _detailStore.message,
                    icon: CupertinoIcons.wifi_slash,
                    isConnectionError: true,
                    onPressed: () => _detailStore
                        .fetchDetailRestaurant(widget.restaurant.id),
                  );
              }
            },
          ),
        ),
      ),
    ];
  }

  Widget _buildCategory(RestaurantDetail detail) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: detail.categories
          .map((category) => Chip(
                backgroundColor: ColorHelper.getColorByCategory(category.name)
                    .withOpacity(0.2),
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                label: Text(
                  category.name,
                  style: TextStyle(
                    color: ColorHelper.getColorByCategory(category.name),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildRatingAndCity(BuildContext context) {
    return Row(
      children: [
        RatingChip(
          rating: widget.restaurant.rating,
        ),
        SizedBox(width: 12),
        Icon(
          CupertinoIcons.map_pin_ellipse,
          size: 18,
          color: accentColor,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            widget.restaurant.city,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomSliverAppBar(
        restaurant: widget.restaurant,
        maxHeight: 200 + MediaQuery.of(context).padding.top,
        toolbarHeight: MediaQuery.of(context).padding.top,
        bookmarkStore: getIt<BookmarkStore>(),
      ),
      pinned: true,
    );
  }
}
