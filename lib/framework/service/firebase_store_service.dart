import 'package:pet_app/framework/model/user_model.dart';
import 'firebase_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  FireStoreService._();

  static FireStoreService fireStoreService = FireStoreService._();

  final uid = FirebaseAuth.instance.currentUser!.uid;
  Future<void> addUserToFirebase(UserModel user) async {
    FirebaseSingleTon.firebaseSingleTon.fireStore
        .collection('users')
        .doc(user.uid)
        .set(user.toJson());
  }


  Future<UserModel> getUserFromFirebase()async{
    final uid=FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!.uid;
    final data =await FirebaseSingleTon.firebaseSingleTon.fireStore.collection('users')
        .doc(uid).get().then((value) => value.data()!);
    final userModel = UserModel.fromJson(data);
    return userModel;
  }

  Future<void> updateUserToFirebase({
    UserModel? user}) async {
    final uid = FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!
        .uid;
    FirebaseSingleTon.firebaseSingleTon.fireStore
        .collection('users')
        .doc(uid)
        .update({
      'petName': user!.petName,
      'imageUrl': user.imageUrl,
      'gender':user.gender,
      'type':user.type,
      'breed':user.breed,
      'age':user.age,
      'weight':user.weight,
      'diet':user.diet,
      'condition':user.condition,

    });  }

  
  Stream<UserModel> getUserStream() {
    final user = FirebaseSingleTon.firebaseSingleTon.fireStore.collection("users")
        .doc(uid).snapshots().map((e) => UserModel.fromJson(e.data()!));
    return user;
  }
}




