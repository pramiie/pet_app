
import 'package:pet_app/ui/authentication/login.dart';
import 'package:pet_app/ui/pet_profile/pet_profile.dart';

import '../../ui/theme/theme.dart';
import '../model/user_model.dart';

import '../service/firebase_auth_service.dart';
import '../service/firebase_store_service.dart';

final registerController = ChangeNotifierProvider((ref) => RegisterController());

class RegisterController extends ChangeNotifier{

  final GlobalKey<FormState> rKey = GlobalKey();
  final nameController=TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isShowHide = true;

  updateIsShowHide(){
    isShowHide = !isShowHide;
    notifyListeners();
  }


  signUpButton(BuildContext context)async{
    if(rKey.currentState!.validate()){
      print(emailController.text);
      print(passwordController.text);
        final authResponse = await FirebaseAuthService.authService.signUpWithEmailAndPassword(email: emailController.text, password: passwordController.text);
        if(authResponse.user != null){
          final user = UserModel(uid: authResponse.user!.uid,email:emailController.text ,name:nameController.text );
          FireStoreService.fireStoreService.addUserToFirebase(user);
          if(context.mounted){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const PetProfile()), (route) => false);
          }
        }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Enter Valid email and password")));
    }
  }
}