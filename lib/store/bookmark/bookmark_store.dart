import 'package:mobx/mobx.dart';

import '../../core/app/service_locator.dart';
import '../../core/constants/enum.dart';
import '../../core/data/firebase/bookmark_service.dart';
import '../../core/data/models/restaurant.dart';
import '../restaurant/restaurant_store.dart';

part 'bookmark_store.g.dart';

class BookmarkStore = _BookmarkStore with _$BookmarkStore;

abstract class _BookmarkStore with Store {
  final _bookmark = BookmarkService.instance;
  final _restaurants = getIt<RestaurantStore>();

  @observable
  ObservableFuture<List<String>>? _bookmarkFuture;

  @observable
  ObservableList<String> bookmarkRestaurants = ObservableList.of([]);

  @observable
  String message = '';

  @computed
  List<Restaurant> get myBookmark {
    return _restaurants.restaurants
        .where((restaurant) => bookmarkRestaurants.contains(restaurant.id))
        .toList();
  }

  @computed
  NetworkState get networkState {
    if (_bookmarkFuture?.status == FutureStatus.fulfilled)
      return NetworkState.Loaded;
    return _bookmarkFuture?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @computed
  ListRestaurantState get bookmarkState => bookmarkRestaurants.isEmpty
      ? ListRestaurantState.Empty
      : ListRestaurantState.Loaded;

  bool isBookmarked(String id) {
    return bookmarkRestaurants.contains(id);
  }

  @action
  Future<void> fetchBookmark() async {
    try {
      bookmarkRestaurants.clear();
      _bookmarkFuture = ObservableFuture(_bookmark.getBookmark());
      final result = await _bookmarkFuture;
      bookmarkRestaurants = ObservableList.of([...result!]);
    } catch (e) {
      message = e.toString();
    }
  }

  @action
  Future<void> addBookmark(String id) async {
    try {
      await _bookmark.addBookmark(id);
      bookmarkRestaurants.add(id);
    } catch (e) {
      message = e.toString();
    }
  }

  @action
  Future<void> removeBookmark(String id) async {
    try {
      await _bookmark.removeBookmark(id);
      final index = bookmarkRestaurants.indexWhere((element) => element == id);
      bookmarkRestaurants.removeAt(index);
    } catch (e) {
      message = e.toString();
    }
  }
}
