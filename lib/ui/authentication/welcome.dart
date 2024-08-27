import 'package:pet_app/ui/authentication/login.dart';
import 'package:pet_app/ui/authentication/register.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
            SizedBox(height: 25.h),
            Center(
              child: Text(
                "Welcome, Pet Owner!",
                style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 24.sp),
              ),
            ),
            SizedBox(height: 120.h),
            InkWell(child: CommonButton(data:"Create Account"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
              },
            ),
            SizedBox(height: 16.h),
            InkWell(child: CommonText(data: "Existing Member? Login Here",),
                  onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                ),
              ],
            ) ),
    );
  }
}
