import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../core/app/service_locator.dart';
import '../core/constants/api_constant.dart';
import '../core/constants/enum.dart';
import '../core/data/models/restaurant.dart';
import '../store/search/search_store.dart';
import 'state_info.dart';

class CustomSearchItem extends SearchDelegate<Restaurant?> {
  final _searchStore = getIt<SearchStore>();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(CupertinoIcons.xmark),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _searchStore.fetchSearchList(query);
    return Observer(
      builder: (_) {
        switch (_searchStore.networkState) {
          case NetworkState.Initialize:
            return Center(child: CupertinoActivityIndicator());
          case NetworkState.Loaded:
            final restaurants = _searchStore.restaurants;
            if (restaurants.isNotEmpty)
              return ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (BuildContext context, int index) {
                  final restaurant = restaurants[index];
                  return ListTile(
                    leading: Image.network(
                      ApiConstant.imageSmallUrl(restaurant.pictureId),
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.city),
                    onTap: () {
                      close(context, restaurant);
                    },
                  );
                },
              );
            return StateInfo(
              title: 'Your search for \'$query\'\nis not found',
              icon: CupertinoIcons.xmark_circle_fill,
            );
          case NetworkState.Error:
            return StateInfo(
              title: _searchStore.message,
              icon: CupertinoIcons.wifi_slash,
            );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListTile(
      leading: Icon(CupertinoIcons.doc_text_search),
      title: Text('Search by Name, Category or Menu'),
    );
  }
}
