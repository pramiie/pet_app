import 'package:pet_app/ui/pet_profile/pet_profile1.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';

import '../home/home.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({super.key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CommonText2(data: "Pet Profile"),
          centerTitle: true,
          actions: [
            SizedBox(height: 60,),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Bnb()));
              },
              child: CommonText(data: "Skip",),
            ),
          ]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            Image.asset(
             "assets/Logo.png",
              height: 130.h,
              width: 180,
            ),
            SizedBox(height: 68.h),
            Image.asset(
              "assets/image49.png",
              height: 300.h,
              width: 370.w,
            ),
            SizedBox(height: 36.h),
            Container(
              padding:EdgeInsets.symmetric(horizontal: 42.w),
              alignment: Alignment.center,
              child: Text("Fill out a questionnaire for your pets",textAlign: TextAlign.center,
                style: TextStyle( fontWeight: FontWeight.w700,fontSize: 26.sp,),),
            ),
            Container(
              padding:EdgeInsets.symmetric(horizontal: 42.w),
              alignment: Alignment.center,
              child: Text("This give you a more personalized experience, tailored to your pets’ needs.",textAlign: TextAlign.center,
                style: TextStyle( fontWeight: FontWeight.w500,fontSize: 14.sp,color: Color(0XFFABABAB)),),
            ),
            SizedBox(height: 39.h,),
            InkWell(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>PetProfile1()));
                },
                child: CommonButton(data: "Start")),
          ],
        ),
      ),
    );
  }
}
