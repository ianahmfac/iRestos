import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../store/restaurant/restaurant_store.dart';
import '../store/user/user_store.dart';
import '../widgets/custom_search_item.dart';
import '../widgets/restaurant_item.dart';
import '../widgets/state_info.dart';
import '../widgets/tap_slash_item.dart';
import '../widgets/title_section.dart';
import 'detail_restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;

  final _restaurantsStore = getIt<RestaurantStore>();
  final _userStore = getIt<UserStore>();

  void _goToDetail(Restaurant restaurant) {
    Navigator.pushNamed(context, DetailRestaurant.routeName,
        arguments: restaurant);
  }

  void _goToSearch() async {
    final getSearch =
        await showSearch(context: context, delegate: CustomSearchItem());
    if (getSearch != null) _goToDetail(getSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iResto\'s'),
      ),
      body: _contentBody(),
    );
  }

  Widget _contentBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGreetingsHeader(context),
        TitleSection(title: 'Discover Restaurant'),
        _buildSearchBox(context),
        TitleSection(
          title: 'Popular Restaurant',
          hasButtonRefreshed: true,
          onPressed: () => _restaurantsStore.fetchRestaurants(),
        ),
        _buildRestoItem()
      ],
    );
  }

  Widget _buildRestoItem() {
    return Expanded(
      child: Observer(
        builder: (_) {
          switch (_restaurantsStore.networkState) {
            case NetworkState.Initialize:
              return Center(child: CupertinoActivityIndicator());
            case NetworkState.Loaded:
              final restaurants = _restaurantsStore.restaurants;
              if (_restaurantsStore.restaurantsState ==
                  ListRestaurantState.Loaded)
                return Column(
                  children: [
                    Expanded(
                      child: CarouselSlider.builder(
                        itemCount: restaurants.length,
                        itemBuilder: (context, index, realIndex) {
                          final restaurant = restaurants[index];
                          return RestaurantItem(
                            restaurant: restaurant,
                            onPressed: () => _goToDetail(restaurant),
                          );
                        },
                        options: CarouselOptions(
                          height: double.infinity,
                          enableInfiniteScroll: true,
                          viewportFraction: 0.6,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _activeIndex = index;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        restaurants.length,
                        (index) => _buildIndicator(index),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                );
              return StateInfo(
                title: 'Restaurants is Empty',
                icon: CupertinoIcons.xmark_circle_fill,
              );
            case NetworkState.Error:
              return StateInfo(
                title: _restaurantsStore.message,
                icon: CupertinoIcons.wifi_slash,
                isConnectionError: true,
                onPressed: () => _restaurantsStore.fetchRestaurants(),
              );
          }
        },
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: const EdgeInsets.only(right: 4),
      height: 6,
      width: index == _activeIndex ? 16 : 6,
      decoration: BoxDecoration(
        color: index == _activeIndex ? accentColor : unselectedColor,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  Widget _buildSearchBox(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primaryColor,
      ),
      child: TapSlashItem(
        onPressed: _goToSearch,
        itemRadius: 16,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Row(
              children: [
                Icon(CupertinoIcons.search),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'Search for Restaurants',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGreetingsHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 30,
        left: 30,
        top: 8,
      ),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.person_crop_circle_fill,
            size: 70,
            color: accentColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(builder: (context) {
                  switch (_userStore.networkState) {
                    case NetworkState.Initialize:
                      return Text('Loading...');
                    case NetworkState.Loaded:
                      return Text.rich(
                        TextSpan(
                          text: 'Hello, ',
                          style: Theme.of(context).textTheme.subtitle1,
                          children: [
                            TextSpan(
                              text: _userStore.currentUser?.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  ?.copyWith(
                                    color: accentColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      );
                    case NetworkState.Error:
                      return Text(_userStore.message);
                  }
                }),
                Text(
                  'Find some Restaurant. Want to try?',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
