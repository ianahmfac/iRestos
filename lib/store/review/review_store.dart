import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/api/api_service.dart';

part 'review_store.g.dart';

class ReviewStore = _ReviewStore with _$ReviewStore;

abstract class _ReviewStore with Store {
  final _api = ApiService.instance;

  String name = '';
  String review = '';

  @observable
  ObservableFuture<bool>? _future;

  @observable
  bool isComplete = false;

  @observable
  String message = '';

  @computed
  NetworkState get networkState {
    if (_future?.status == FutureStatus.pending) return NetworkState.Initialize;
    return _future?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Loaded;
  }

  @action
  void setName(String? value) {
    name = value!;
  }

  @action
  void setReview(String? value) {
    review = value!;
  }

  @action
  String? validateForm(String? value) {
    if (value!.trim().isEmpty) return 'This field cannot be empty';
    return null;
  }

  @action
  Future<void> postReview(String id) async {
    try {
      _future = ObservableFuture(_api.postReview(id, name, review));
      isComplete = await _future!;
    } catch (e) {
      isComplete = false;
      message = e.toString();
    }
  }
}
