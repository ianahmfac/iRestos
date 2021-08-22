// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$isLoadingAtom = Atom(name: '_AuthStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$messageAtom = Atom(name: '_AuthStore.message');

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

  final _$signUpAsyncAction = AsyncAction('_AuthStore.signUp');

  @override
  Future<bool> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  final _$signInAsyncAction = AsyncAction('_AuthStore.signIn');

  @override
  Future<bool> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void setEmail(String? value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String? value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePassword(String? value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateName(String? value) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signOut() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.signOut');
    try {
      return super.signOut();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool hasUserLoggedIn() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.hasUserLoggedIn');
    try {
      return super.hasUserLoggedIn();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
message: ${message}
    ''';
  }
}
