import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class CrudPostService {
  final Firestore _db = Firestore.instance;
  final String path;
  CollectionReference ref;

  CrudPostService(this.path) {
    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  Future<DocumentSnapshot> getPostById(String id) {
    return ref.document(id).get();
  }

  Future<void> removePost(String id) {
    return ref.document(id).delete();
  }

  Future<DocumentReference> addPost(Map data) {
    return ref.add(data);
  }

  Future<void> updatePost(Map data, String id) {
    return ref.document(id).updateData(data);
  }
}
