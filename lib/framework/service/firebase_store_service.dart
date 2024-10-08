import 'package:pet_app/framework/model/user_model.dart';
import 'firebase_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  FireStoreService._();

  static FireStoreService fireStoreService = FireStoreService._();


  Future<void> addUserToFirebase(UserModel user) async {
    FirebaseSingleTon.firebaseSingleTon.fireStore
        .collection('users')
        .doc(user.uid)
        .set(user.toJson());
  }


  Future<UserModel> getUserFromFirebase(String uid)async{
    final data =await FirebaseSingleTon.firebaseSingleTon.fireStore.collection('users')
        .doc(uid).get().then((value) => value.data()!);
    final userModel = UserModel.fromJson(data);
    return userModel;
  }

  Future<void> updatePetToFirebase({
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
     // 'userImg':user.userImg,

    });  }

  Future<void> editUserToFirebase({required String userImg,
    String? name}) async {
    final uid = FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!
        .uid;
    FirebaseSingleTon.firebaseSingleTon.fireStore
        .collection('users')
        .doc(uid)
        .update({
      'name': name,
      'userImg': userImg,
    });
  }
  Stream<UserModel> getUserStream() {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final user = FirebaseSingleTon.firebaseSingleTon.fireStore.collection("users")
        .doc(uid).snapshots().map((e) => UserModel.fromJson(e.data()!));
    return user;
  }
}




