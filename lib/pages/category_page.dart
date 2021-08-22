import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../core/utils/color_helper.dart';
import '../store/search/search_store.dart';
import '../widgets/restaurant_item.dart';
import '../widgets/state_info.dart';
import 'detail_restaurant.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/category-page';

  final String category;
  const CategoryPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _searchStore = getIt<SearchStore>();

  void _goToDetail(Restaurant restaurant) {
    Navigator.pushNamed(
      context,
      DetailRestaurant.routeName,
      arguments: restaurant,
    );
  }

  @override
  void initState() {
    super.initState();
    _searchStore.fetchSearchList(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: _contentBody(),
    );
  }

  Widget _contentBody() {
    return Observer(
      builder: (_) {
        switch (_searchStore.networkState) {
          case NetworkState.Initialize:
            return Center(child: CupertinoActivityIndicator());
          case NetworkState.Error:
            return StateInfo(
              title: _searchStore.message,
              icon: CupertinoIcons.wifi_slash,
              isConnectionError: true,
              onPressed: () => _searchStore.fetchSearchList(widget.category),
            );
          case NetworkState.Loaded:
            final restaurants = _searchStore.restaurants;
            if (restaurants.isNotEmpty) {
              return RefreshIndicator(
                color: ColorHelper.getColorByCategory(widget.category),
                onRefresh: () => _searchStore.fetchSearchList(widget.category),
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  itemCount: restaurants.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return RestaurantItem(
                      restaurant: restaurant,
                      onPressed: () => _goToDetail(restaurant),
                    );
                  },
                ),
              );
            }
            return StateInfo(
              title: 'Restaurants is Empty',
              icon: CupertinoIcons.xmark_circle_fill,
            );
        }
      },
    );
  }
}
