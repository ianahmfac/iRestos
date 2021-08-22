import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/api/api_service.dart';
import '../../core/data/models/restaurant.dart';

part 'restaurant_store.g.dart';

class RestaurantStore = _RestaurantStore with _$RestaurantStore;

abstract class _RestaurantStore with Store {
  final _api = ApiService.instance;

  @observable
  ObservableFuture<List<Restaurant>>? _restaurantsFuture;

  @observable
  ObservableList<Restaurant> restaurants = ObservableList.of([]);

  @observable
  String message = '';

  @computed
  NetworkState get networkState {
    if (_restaurantsFuture?.status == FutureStatus.fulfilled)
      return NetworkState.Loaded;
    return _restaurantsFuture?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @computed
  ListRestaurantState get restaurantsState => restaurants.isEmpty
      ? ListRestaurantState.Empty
      : ListRestaurantState.Loaded;

  @action
  Future<void> fetchRestaurants() async {
    try {
      restaurants.clear();
      _restaurantsFuture = ObservableFuture(_api.getListRestaurant());
      final result = await _restaurantsFuture;
      restaurants = ObservableList.of([...result!]);
    } catch (e) {
      message = e.toString();
    }
  }
}
