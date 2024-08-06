import 'package:pet_app/ui/theme/theme.dart';

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({super.key, this.hintText,this.suffixIcon,
    this.prefixIcon, this.controller, this.maxLines, this.validator, this.obscureText});
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText??false,
      maxLines: maxLines??1,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor:Color(0xFFF6F6F6),
       /* suffixStyle:  TextStyle(
          color: Color(0xFFB12A1C),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),*/
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelStyle:TextStyle(color: Color(0xFF666666),fontSize: 16.sp,fontWeight:FontWeight.w500,) ,
        hintText:hintText,
        hintStyle: TextStyle(color:Color(0xFFBDBDBD),fontSize: 16.sp,fontWeight:FontWeight.w500,),
          contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),

          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
              borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14.r),
                borderSide: BorderSide(color: Color(0xFFE8E8E8).withOpacity(.8))),
      ),
    );
  }
}
