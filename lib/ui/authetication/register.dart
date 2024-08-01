import 'package:pet_app/framework/controller/register_controller.dart';
import 'package:pet_app/ui/authetication/login.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/validator.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';
import 'package:pet_app/ui/authetication/welcome.dart';

class Register extends ConsumerWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final registerWatch=ref.watch(registerController);
    return  Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Image.asset("assets/X.png"),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Welcome()));
          },),
        title: CommonText2(data: "Sign Up"),
        centerTitle: true,
        actions:[
          //SizedBox(width: 85.w,),
          InkWell(child: CommonText(data: "Login",),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            },),
          SizedBox(width: 16,),
        ],
      ),
      body: Form(
        key: registerWatch.rKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h,),

              SizedBox(height: 32.h,),
              CommonTextfield(hintText: "Name",controller: registerWatch.nameController,
              validator: (value){
                return  requiredFieldValidator(input: value, errorMgs: "please enter your name");
              },),
              SizedBox(height: 16.h,),
              CommonTextfield(hintText: "Email",controller: registerWatch.emailController,validator: emailValidator,),
              SizedBox(height: 16.h,),
              CommonTextfield(hintText: "Password",suffixText: "Show",controller: registerWatch.passwordController  ,
                validator: passValidator,),

              SizedBox(height: 32.h),
              Row(
                children: [
                  SizedBox(width: 8.w),
                  Checkbox(value: false, onChanged: (bool? value) {  },checkColor: Color(0XFFF6F6F6),),
                  Expanded(
                    child: Text("I would like to receive your newsletter and other promotional information.",
                    style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w400,color: Color(0XFF666666)),),
                  )
                ],
              ),
              SizedBox(height: 43.h),

              InkWell(child: CommonButton(data:"Sign Up"),
              onTap: (){
                registerWatch.signUpButton(context);

              },),
              SizedBox(height: 16.h),
              InkWell(child: CommonText(data: "Allready have an account?",),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
