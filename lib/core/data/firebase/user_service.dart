import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_app.dart';

class UserService {
  UserService._();
  static final instance = UserService._();

  final _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserApp user) async {
    try {
      final collection = _firestore.collection('users');
      await collection.doc(user.id).set(user.toMap());
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserApp> getUser(String uid) async {
    try {
      final collection = _firestore.collection('users');
      final docSnapshot = await collection.doc(uid).get();
      return UserApp.fromMap(docSnapshot.data()!);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> updateUser(String uid, String name) async {
    try {
      final collection = _firestore.collection('users');
      await collection.doc(uid).update({'name': name});
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
