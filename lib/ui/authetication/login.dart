import 'package:pet_app/ui/authetication/forgotPass.dart';
import 'package:pet_app/ui/authetication/register.dart';
import 'package:pet_app/ui/authetication/splash.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/validator.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';
import 'package:pet_app/ui/authetication/welcome.dart';

import '../../framework/controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginWatch=ref.watch(loginController);
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Image.asset("assets/X.png"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
          },),
        title: CommonText2(data: "Log In"),
        centerTitle: true,
        actions:[
          InkWell(child: CommonText(data: "Sign Up",),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
            },),
          SizedBox(width: 16,),
        ],
      ),
      body: Form(
        key: loginWatch.loginKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 23.0, right: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16.h,),
                SizedBox(height: 32.h,),
                CommonTextfield(hintText: "Email",validator: emailValidator,
                controller: loginWatch.emailController,),
                SizedBox(height: 16.h,),
                CommonTextfield(hintText: "Password",obscureText:loginWatch.isShowHide,
                  suffixIcon:TextButton(onPressed: (){
                  loginWatch.updateIsShowHide();
                }, child: const CommonText(data: "Show",)),
                  controller: loginWatch.passwordController,
                  validator: passValidator,),

                SizedBox(height: 120.h),
                InkWell(child: CommonButton(data:"Log In"),
                  onTap: ()async{
                    loginWatch.signInButton(context);
                  },),
                SizedBox(height: 16.h),
                InkWell(child: CommonText(data: "Forgot your password?",),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasword()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
