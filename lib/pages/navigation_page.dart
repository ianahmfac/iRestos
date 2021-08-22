import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/app/service_locator.dart';
import '../core/utils/notification_helper.dart';
import '../store/bookmark/bookmark_store.dart';
import '../store/restaurant/restaurant_store.dart';
import '../store/user/user_store.dart';
import 'bookmark_page.dart';
import 'categories_page.dart';
import 'detail_restaurant.dart';
import 'home_page.dart';
import 'profile_page.dart';

class NavigationPage extends StatefulWidget {
  static const routeName = '/navigation';
  const NavigationPage({Key? key}) : super(key: key);

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;
  final _notificationHelper = NotificationHelper.instance;

  @override
  void initState() {
    super.initState();
    getIt<RestaurantStore>().fetchRestaurants();
    getIt<UserStore>().fetchUserLogin();
    getIt<BookmarkStore>().fetchBookmark();
    _notificationHelper
        .configureSelectNotificationSubject(DetailRestaurant.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.circle_grid_3x3),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _selectedPage() {
    switch (_currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return CategoriesPage();
      case 2:
        return BookmarkPage();
      case 3:
        return ProfilePage();
      default:
        return Center(
          child: Text('Page Not Found'),
        );
    }
  }
}
