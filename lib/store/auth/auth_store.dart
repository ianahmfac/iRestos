import 'package:mobx/mobx.dart';

import '../../core/data/firebase/auth_service.dart';
import '../../core/data/firebase/user_service.dart';
import '../../core/utils/string_helper.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final _auth = AuthService.instance;
  final _user = UserService.instance;

  String email = '';
  String name = '';
  String password = '';

  @observable
  bool isLoading = false;

  @observable
  String message = '';

  @action
  void setEmail(String? value) {
    email = value!;
  }

  @action
  void setName(String? value) {
    name = value!;
  }

  @action
  void setPassword(String? value) {
    password = value!;
  }

  @action
  String? validateEmail(String? value) {
    if (value!.isEmpty) return 'Email can not be empty';
    if (!StringHelper.isValidEmail(value)) return 'Email is not valid';
    return null;
  }

  @action
  String? validatePassword(String? value) {
    if (value!.isEmpty) return 'Password can not be empty';
    if (value.length < 6) return 'Password must contain at least 6 characters';
    return null;
  }

  @action
  String? validateName(String? value) {
    if (value!.isEmpty) return 'Name can not be empty';
    return null;
  }

  @action
  Future<bool> signUp() async {
    try {
      isLoading = true;
      final user = await _auth.signUp(email, password, name);
      await _user.addUser(user);
      isLoading = false;
      return true;
    } catch (e) {
      isLoading = false;
      message = e.toString();
      return false;
    }
  }

  @action
  Future<bool> signIn() async {
    try {
      isLoading = true;
      await _auth.signIn(email, password);
      isLoading = false;
      return true;
    } catch (e) {
      isLoading = false;
      message = e.toString();
      return false;
    }
  }

  @action
  void signOut() {
    _auth.signOut();
  }

  @action
  bool hasUserLoggedIn() {
    final user = _auth.currentUser;
    return user != null;
  }
}
