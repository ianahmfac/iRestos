import 'package:mobx/mobx.dart';

import '../../core/constants/enum.dart';
import '../../core/data/firebase/auth_service.dart';
import '../../core/data/firebase/user_service.dart';
import '../../core/data/models/user_app.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final _userService = UserService.instance;
  final _auth = AuthService.instance;

  String nameUpdate = '';

  @observable
  ObservableFuture<UserApp>? _future;

  @observable
  UserApp? currentUser;

  @observable
  String message = '';

  @observable
  bool updateLoading = false;

  @computed
  NetworkState get networkState {
    if (_future?.status == FutureStatus.fulfilled) return NetworkState.Loaded;
    return _future?.status == FutureStatus.rejected
        ? NetworkState.Error
        : NetworkState.Initialize;
  }

  @action
  Future<void> fetchUserLogin() async {
    try {
      final uid = _auth.currentUser!.uid;
      _future = ObservableFuture(_userService.getUser(uid));
      currentUser = await _future;
    } catch (e) {
      message = e.toString();
    }
  }

  @action
  Future<bool> updateUser() async {
    try {
      updateLoading = true;
      final uid = _auth.currentUser!.uid;
      await _userService.updateUser(uid, nameUpdate);
      updateLoading = false;
      return true;
    } catch (e) {
      updateLoading = false;
      message = e.toString();
      return false;
    }
  }

  @action
  Future<void> resetPassword() async {
    try {
      updateLoading = true;
      await _auth.resetPassword(currentUser!.email);
      updateLoading = false;
    } catch (e) {
      updateLoading = false;
      message = e.toString();
    }
  }

  @action
  void setName(String? value) => nameUpdate = value!;

  @action
  String? validateName(String? value) {
    if (value!.isEmpty) return 'Name can not be empty';
    return null;
  }
}
