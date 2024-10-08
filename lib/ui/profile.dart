
import 'package:pet_app/framework/service/firebase_auth_service.dart';
import 'package:pet_app/ui/alert_dialog.dart';
import 'package:pet_app/ui/authentication/login.dart';
import 'package:pet_app/ui/theme/theme.dart';
import '../framework/controller/pet_Profile_controller.dart';
import '../framework/model/user_model.dart';
import '../framework/service/firebase_store_service.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final profileWatch=ref.watch(petProfileController);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Profile',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color(0xFF404E7E),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.w),
        child: StreamBuilder<UserModel>(
          stream: FireStoreService.fireStoreService.getUserStream(),
          builder: (context, snapshot) {

            final user = snapshot.data;
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasData){
              return Column(
                children: [
                  // Profile Picture
                  Center(
                    child: user!.userImg !=null?CircleAvatar(
                      radius: 65.r,
                      backgroundImage: NetworkImage(user.userImg.toString()),
                    ):Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0XFFB12A1C), width: 3.w),
                      ),
                      child: Icon(Icons.person_3,color:Color(0XFFB12A1C)),
                    ),
                    ),

                  SizedBox(height: 20.h),

                  // User Name
                  Text(
                    user.name??"",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // User Email
                  Text(
                    "${user.email}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF888888),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // Edit Profile Button
                  InkWell(
                    onTap: () {
                      //profileWatch.onEditButtonSubmit(context);
                      profileWatch.userNameCon.text="${user.name}";
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialogBox();
                          },
                        );

                    },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color:const Color(0xFF404E7E),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 18.sp,color: Colors.white),
                      ),
                    ),

                  ),
                  SizedBox(height: 20.h),

                  // Log Out Button
                  InkWell(
                    onTap: ()async{
                      FirebaseAuthService.authService.logout();
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context)=>Login()),(route) => false,);
                    },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color:const Color(0XFFB12A1C),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Log Out',
                        style: TextStyle(fontSize: 18.sp,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }else{
              return const Center(child: Text("No data found"),);
            }

          }
        ),
      ));
  }

}
