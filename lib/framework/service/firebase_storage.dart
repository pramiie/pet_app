import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import '../../ui/theme/theme.dart';
import 'firebase_singleton.dart';


class FirebaseStorage {
  FirebaseStorage._();

  static FirebaseStorage firebaseStorage = FirebaseStorage._();

  Future<String> upLoadImage(
      BuildContext context, File file) async {
    try {
      final baseName = basename(file.path);
      final imgRef = FirebaseSingleTon.firebaseSingleTon.firebaseStorage
          .ref('petProfile1/$baseName');
      await imgRef.putFile(file);
      return imgRef.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message.toString());
    }
    }
}