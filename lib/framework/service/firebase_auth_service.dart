import 'package:firebase_auth/firebase_auth.dart';
import '../model/auth_response.dart';
import '../model/user_model.dart';
import 'firebase_singleton.dart';



class FirebaseAuthService{

  FirebaseAuthService._();

  static FirebaseAuthService authService = FirebaseAuthService._();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<AuthResponse> signUpWithEmailAndPassword({
    required String email,required String password})async{
    try{
      final response = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if(response.user != null){
        final uid=FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!.uid;
        return AuthResponse(user: UserModel(email: response.user!.email, uid:uid));
      }else{
        return AuthResponse(error: "user is already exist");
      }
    }on FirebaseAuthException catch(e){
      Future.error(e.message.toString());
      return AuthResponse(error:e.message.toString());
    }
  }


  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user!;
      return AuthResponse(user: UserModel(uid: user.uid, email: user.email));
    } on FirebaseAuthException catch (e) {
      return AuthResponse(error: e.message.toString());
    }
   }

  Future<void> logout() async{
    await FirebaseSingleTon.firebaseSingleTon.firebaseAuth.signOut();
  }
}