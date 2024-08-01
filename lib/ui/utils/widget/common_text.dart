import 'package:pet_app/ui/theme/theme.dart';

class CommonText extends StatelessWidget {
  const CommonText({super.key, this.data, this.fontSize, this.decoration});
  final String? data;
  final double? fontSize;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return  Text(data??
      "Forgot your password?",
      style: TextStyle(
        decoration: decoration,
        color: Color(0xFFB12A1C),
        fontSize:fontSize?? 16.sp,
        fontWeight: FontWeight.w600,
      )
    );

  }
}
class CommonText2 extends StatelessWidget {
  const CommonText2({super.key, required this.data, this.FontSize});
  final String data;
  final double? FontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.black,
        fontSize: FontSize ?? 30.sp,  // Default font size is 30.sp if not provided
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
