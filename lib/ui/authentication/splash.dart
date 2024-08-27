import 'dart:async';
import 'package:pet_app/framework/model/user_model.dart';
import 'package:pet_app/framework/service/firebase_singleton.dart';
import 'package:pet_app/framework/service/firebase_store_service.dart';
import 'package:pet_app/ui/pet_profile/pet_profile.dart';
import 'package:pet_app/ui/theme/theme.dart';
import '../home/home.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  Future<void> whereToGo() async {
    await Future.delayed(Duration(seconds: 2));

    final user = FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser;

    if (user != null) {
      final uid = user.uid;
      try {
        UserModel userModel = await FireStoreService.fireStoreService.getUserFromFirebase(uid);
        if (userModel.petName != null) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Bnb()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PetProfile()));
        }
      } catch (e) {
        // Handle the error, maybe navigate to an error page or show a dialog
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    } else {
      Navigator.pushReplacementNamed(context, '/welcome');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),
              Image.asset(
                "assets/Logo.png",
                height: 130.h,
                width: 180,
              ),
              SizedBox(height: 54.h),
              Text(
                "Championing Pet Care",
                style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 24.sp),
              ),
              SizedBox(height: 14.h),
              Image.asset(
                "assets/image49.png",
                //AppAsset.dog,
                height: 300.h,
                width: 375.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

