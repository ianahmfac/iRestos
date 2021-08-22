import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/api/api_service.dart';
import '../../core/data/models/restaurant_detail.dart';

part 'detail_store.g.dart';

class DetailStore = _DetailStore with _$DetailStore;

abstract class _DetailStore with Store {
  final _api = ApiService.instance;
  @observable
  ObservableFuture<RestaurantDetail>? _detailFuture;

  @observable
  RestaurantDetail? restaurantDetail;

  @observable
  String message = '';

  @computed
  NetworkState get networkState {
    if (_detailFuture?.status == FutureStatus.fulfilled)
      return NetworkState.Loaded;
    return _detailFuture?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @action
  Future<void> fetchDetailRestaurant(String id) async {
    try {
      _detailFuture = ObservableFuture(_api.getRestaurantDetail(id));
      restaurantDetail = await _detailFuture;
    } catch (e) {
      message = e.toString();
    }
  }
}
