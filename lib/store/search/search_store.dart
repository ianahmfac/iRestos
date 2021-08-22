import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/api/api_service.dart';
import '../../core/data/models/restaurant.dart';

part 'search_store.g.dart';

class SearchStore = _SearchStore with _$SearchStore;

abstract class _SearchStore with Store {
  final _api = ApiService.instance;
  @observable
  ObservableFuture<List<Restaurant>>? _future;

  @observable
  ObservableList<Restaurant> restaurants = ObservableList.of([]);

  @observable
  String message = '';

  @computed
  NetworkState get networkState {
    if (_future?.status == FutureStatus.fulfilled) return NetworkState.Loaded;
    return _future?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @action
  Future<void> fetchSearchList(String query) async {
    try {
      _future = ObservableFuture(_api.getListRestaurant(query: query));
      final result = await _future;
      restaurants = ObservableList.of([...result!]);
    } catch (e) {
      message = e.toString();
    }
  }
}
