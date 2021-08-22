import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth_service.dart';

class BookmarkService {
  BookmarkService._();
  static final instance = BookmarkService._();

  final _firestore = FirebaseFirestore.instance;
  final _authService = AuthService.instance;

  Future<void> addBookmark(String id) async {
    try {
      final collection = _firestore
          .collection('users/${_authService.currentUser!.uid}/bookmark');
      await collection.doc(id).set({});
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> removeBookmark(String id) async {
    try {
      final collection = _firestore
          .collection('users/${_authService.currentUser!.uid}/bookmark');
      await collection.doc(id).delete();
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<String>> getBookmark() async {
    try {
      final List<String> idBookmark = [];
      final collection = _firestore
          .collection('users/${_authService.currentUser!.uid}/bookmark');
      final snapshot = await collection.get();
      snapshot.docs.forEach((doc) {
        idBookmark.add(doc.id);
      });
      return idBookmark;
    } on FirebaseException catch (e) {
      throw e.message.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
