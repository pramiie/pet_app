
import "package:pet_app/framework/model/user_model.dart";


class AuthResponse{
  UserModel? user;
  String? error;

  AuthResponse({ this.error,this.user});
}