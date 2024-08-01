import 'package:pet_app/ui/theme/theme.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, required this.data, this.borderRadius, this.width, this.height, this.color});
  final String data;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:height?? 51.h,
      width:width?? 343.w,
      child: Center(
        child: Text(data,style: TextStyle(
            color:Colors.white,
          fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: color??Color(0XFFB12A1C),
        borderRadius:borderRadius?? BorderRadius.circular(100.0.r),
      ),
    );
  }
}
