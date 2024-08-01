import 'package:pet_app/ui/authetication/login.dart';

import 'package:pet_app/ui/theme/theme.dart';

import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';

class ForgotPasword extends StatefulWidget {
  const ForgotPasword({super.key});

  @override
  State<ForgotPasword> createState() => _ForgotPaswordState();
}

class _ForgotPaswordState extends State<ForgotPasword> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h,),
              CommonText2(data: "Log In"),
              SizedBox(height: 32.h,),
              CommonTextfield(hintText: "New Passeord",),
              SizedBox(height: 16.h,),
              CommonTextfield(hintText: "Re-Enter Password",suffixText: "Show",),

              SizedBox(height: 120.h),
              InkWell(child: CommonButton(data:"Change Paswword"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },),
              SizedBox(height: 16.h),

            ],
          ),
        ),
      ),
    );
  }
}
