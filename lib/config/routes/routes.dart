import 'package:flutter/material.dart';

import '../../core/data/models/restaurant.dart';
import '../../pages/add_review_form.dart';
import '../../pages/category_page.dart';
import '../../pages/detail_restaurant.dart';
import '../../pages/edit_profile_page.dart';
import '../../pages/navigation_page.dart';
import '../../pages/review_page.dart';
import '../../pages/sign_in_page.dart';
import '../../pages/sign_up_page.dart';

class Routes {
  static Route<dynamic>? routeSettings(RouteSettings settings) {
    switch (settings.name) {
      case SignInPage.routeName:
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
      case SignUpPage.routeName:
        return MaterialPageRoute(
          builder: (context) => SignUpPage(),
        );
      case NavigationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => NavigationPage(),
        );
      case DetailRestaurant.routeName:
        return MaterialPageRoute(
          builder: (context) => DetailRestaurant(
            restaurant: settings.arguments as Restaurant,
          ),
        );
      case ReviewPage.routeName:
        return MaterialPageRoute(
          builder: (context) => ReviewPage(
            restaurant: settings.arguments as Restaurant,
          ),
        );
      case AddReviewForm.routeName:
        return MaterialPageRoute(
          builder: (context) => AddReviewForm(
            restaurant: settings.arguments as Restaurant,
          ),
          fullscreenDialog: true,
        );
      case CategoryPage.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              CategoryPage(category: settings.arguments as String),
        );
      case EditProfilePage.routeName:
        return MaterialPageRoute(
          builder: (context) => EditProfilePage(),
          fullscreenDialog: true,
        );
    }
  }
}
