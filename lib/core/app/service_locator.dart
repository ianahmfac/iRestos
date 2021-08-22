import 'dart:isolate';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../store/auth/auth_store.dart';
import '../../store/bookmark/bookmark_store.dart';
import '../../store/detail/detail_store.dart';
import '../../store/restaurant/restaurant_store.dart';
import '../../store/review/review_store.dart';
import '../../store/scheduling/scheduling_store.dart';
import '../../store/search/search_store.dart';
import '../../store/user/user_store.dart';

final getIt = GetIt.I;

class ServiceLocator {
  static void setupLocator() {
    getIt.registerSingleton<RestaurantStore>(RestaurantStore());
    getIt.registerSingleton<DetailStore>(DetailStore());
    getIt.registerSingleton<SearchStore>(SearchStore());
    getIt.registerSingleton<ReviewStore>(ReviewStore());
    getIt.registerSingleton<SchedulingStore>(SchedulingStore());
    getIt.registerSingleton<AuthStore>(AuthStore());
    getIt.registerSingleton<UserStore>(UserStore());
    getIt.registerSingleton<BookmarkStore>(BookmarkStore());

    getIt.registerSingleton<ReceivePort>(ReceivePort());
    getIt.registerSingleton<Future<SharedPreferences>>(
      SharedPreferences.getInstance(),
    );
  }
}
