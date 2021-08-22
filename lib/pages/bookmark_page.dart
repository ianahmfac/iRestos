import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../config/theme/styles.dart';
import '../core/app/service_locator.dart';
import '../core/constants/enum.dart';
import '../store/bookmark/bookmark_store.dart';
import '../widgets/restaurant_item.dart';
import '../widgets/state_info.dart';
import 'detail_restaurant.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final _bookmarkStore = getIt<BookmarkStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmark Page'),
      ),
      body: Observer(
        builder: (context) {
          switch (_bookmarkStore.networkState) {
            case NetworkState.Initialize:
              return Center(child: CupertinoActivityIndicator());
            case NetworkState.Loaded:
              if (_bookmarkStore.bookmarkState == ListRestaurantState.Empty) {
                return Center(
                  child: StateInfo(
                    title: 'Wishlist is Empty',
                    icon: CupertinoIcons.bookmark_fill,
                  ),
                );
              }
              return RefreshIndicator(
                onRefresh: () => _bookmarkStore.fetchBookmark(),
                color: accentColor,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  itemCount: _bookmarkStore.myBookmark.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final restaurant = _bookmarkStore.myBookmark[index];
                    return RestaurantItem(
                      restaurant: restaurant,
                      onPressed: () => Navigator.pushNamed(
                        context,
                        DetailRestaurant.routeName,
                        arguments: restaurant,
                      ),
                    );
                  },
                ),
              );
            case NetworkState.Error:
              return StateInfo(
                title: _bookmarkStore.message,
                icon: CupertinoIcons.wifi_slash,
                isConnectionError: true,
                onPressed: () => _bookmarkStore.fetchBookmark(),
              );
          }
        },
      ),
    );
  }
}
