import 'dart:async';

import 'package:pet_app/framework/service/firebase_singleton.dart';
import 'package:pet_app/ui/pet_profile/pet_profile.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void whereToGo() async{
    /*var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(AppConstant.loginKey)??false;*/
    Future.delayed(Duration(seconds: 2),() {
      if(FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser !=null){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>PetProfile()));
      }else{
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    },);


    // Timer(Duration(seconds: 3), () {
    //     if(isLoggedIn){
    //       Navigator.pushReplacement(context,
    //           MaterialPageRoute(builder: (context)=>PetProfile()));}
    //     else{
    //       Navigator.pushReplacementNamed(context, '/welcome'); }
    //   });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90.h),
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
              width: 370.w,
            ),
          ],
        ),
      ),
    );
  }
}

