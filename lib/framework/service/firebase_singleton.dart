import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_app/framework/service/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class FirebaseSingleTon{
  FirebaseSingleTon._();
  static FirebaseSingleTon firebaseSingleTon = FirebaseSingleTon._();

  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final firebaseStorage = firebase_storage.FirebaseStorage.instance;


}