// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<NetworkState>? _$networkStateComputed;

  @override
  NetworkState get networkState => (_$networkStateComputed ??=
          Computed<NetworkState>(() => super.networkState,
              name: '_UserStore.networkState'))
      .value;

  final _$_futureAtom = Atom(name: '_UserStore._future');

  @override
  ObservableFuture<UserApp>? get _future {
    _$_futureAtom.reportRead();
    return super._future;
  }

  @override
  set _future(ObservableFuture<UserApp>? value) {
    _$_futureAtom.reportWrite(value, super._future, () {
      super._future = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_UserStore.currentUser');

  @override
  UserApp? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(UserApp? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$messageAtom = Atom(name: '_UserStore.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$updateLoadingAtom = Atom(name: '_UserStore.updateLoading');

  @override
  bool get updateLoading {
    _$updateLoadingAtom.reportRead();
    return super.updateLoading;
  }

  @override
  set updateLoading(bool value) {
    _$updateLoadingAtom.reportWrite(value, super.updateLoading, () {
      super.updateLoading = value;
    });
  }

  final _$fetchUserLoginAsyncAction = AsyncAction('_UserStore.fetchUserLogin');

  @override
  Future<void> fetchUserLogin() {
    return _$fetchUserLoginAsyncAction.run(() => super.fetchUserLogin());
  }

  final _$updateUserAsyncAction = AsyncAction('_UserStore.updateUser');

  @override
  Future<bool> updateUser() {
    return _$updateUserAsyncAction.run(() => super.updateUser());
  }

  final _$resetPasswordAsyncAction = AsyncAction('_UserStore.resetPassword');

  @override
  Future<void> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setName(String? value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateName(String? value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
message: ${message},
updateLoading: ${updateLoading},
networkState: ${networkState}
    ''';
  }
}
