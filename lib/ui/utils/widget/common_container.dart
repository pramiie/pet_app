import 'package:flutter/material.dart';
import 'package:pet_app/ui/theme/theme.dart';

import 'common_text.dart';

class Container1 extends StatelessWidget {
  const Container1({super.key, this.border});
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(16.w),
            height:205.h ,
            width:double.infinity,
            decoration: BoxDecoration(
              color: Color(0XFFEFEFEF),
              borderRadius: BorderRadius.circular(10.r),
              border:border?? Border.all(color: Color(0XFFAD2D14),width: 2.w),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText2(data: "PetBox Basic",FontSize: 14.sp,),
                SizedBox(height: 9.h,),
                CommonText2(data: "\$24.99/ month",FontSize: 16.sp,),
                SizedBox(height: 15.h,),
                Row(
                  children: [
                    Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16.sp,),
                    SizedBox(width: 8.w,),
                    Text("Monthly supply of Pet Food",style: TextStyle(
                        fontWeight: FontWeight.w500,color: Color(0XFF666666),
                        fontSize: 12.sp
                    ),),],),
                SizedBox(height: 11.h,),
                Row(
                  children: [
                    Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16,),
                    SizedBox(width: 8.w,),
                    Text("Assorted Pet Toys,Treats, and Accessories",style: TextStyle(
                        fontWeight: FontWeight.w500,color: Color(0XFF666666),fontSize: 12
                    ),),],),
                SizedBox(height: 11.h,),
                Row(
                  children: [
                    Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16.sp,),
                    SizedBox(width: 8.w,),
                    Text("Basic Pet Grooming Supplies",style: TextStyle(
                        fontWeight: FontWeight.w500,color: Color(0XFF666666),
                        fontSize: 12.sp
                    ),),],),
              ],
            ),
         );
  }
}

class Container2 extends StatelessWidget {
  const Container2({super.key,this.border});
  final BoxBorder? border;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      height:205.h ,
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: Color(0XFFEFEFEF),
        borderRadius: BorderRadius.circular(10.r),
        border:border?? Border.all(color: Color(0XFFAD2D14),width: 2.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText2(data: "PetBox Premium",FontSize: 14.sp,),
          SizedBox(height: 9.h,),
          CommonText2(data: "\$44.99/ month",FontSize: 16.sp,),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16.sp,),
              SizedBox(width: 8.w,),
              Text("Monthly supply of Pet Food and Supplements",style: TextStyle(
                  fontWeight: FontWeight.w500,color: Color(0XFF666666),fontSize: 12.sp
              ),),],),
          SizedBox(height: 11.h,),
          Row(
            children: [
              Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16.sp,),
              SizedBox(width: 8.w,),
              Text("Premium Pet Toys,Treats, and Accessories",style: TextStyle(
                  fontWeight: FontWeight.w500,color: Color(0XFF666666),fontSize: 12.sp
              ),),],),
          SizedBox(height: 11.h,),
          Row(
            children: [
              Icon(Icons.check_circle,color: Color(0XFFAD2D14),size: 16.sp,),
              SizedBox(width: 8.w,),
              Text("Premium Pet Grooming Supplies",style: TextStyle(
                  fontWeight: FontWeight.w500,color: Color(0XFF666666),fontSize: 12.sp
              ),),],),
        ],
      ),
    );
  }
}
//shop.dart Button
class Container3 extends StatelessWidget {
  const Container3({super.key, required this.child, this.width, this.color});
 final Widget child;
 final double? width;
 final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.h,
      width:width,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(20.6.r),
        border: Border.all(color: Color(0XFFEDEDED),width: 2.w),
      ),
      child: child,
    );
  }
}

class ContainerProfile extends StatelessWidget {
  const ContainerProfile({super.key, required this.data, required this.height, required this.width,  this.border, this.color});
 final String data;
 final double height;
 final double width;
 final BoxBorder? border;
 final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Color(0XFFF6F6F6),
        borderRadius: BorderRadius.circular(10.r),
        border:border??Border.all(color:Color(0XFFE8E8E8),width: 1.w ) ),
      child: Text(data,style: TextStyle(color: Color(0XFF666666,),
      fontWeight: FontWeight.w500,fontSize: 16.sp),),
    );
  }
}

class RedContainer extends StatelessWidget {
  const RedContainer({super.key, required this.data1, required this.data2,
     required this.height,});
  final String data1;
  final String data2;
  final double height;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(left: 15.w,right: 50.w,top: 20.w),
      height:height,
      width:double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Color(0xFFC04343),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data1,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,
              fontSize: 20.sp),),
          SizedBox(height: 10.h,),
          Text(data2,
            style: TextStyle(color: Color(0XFFF0F0F0),fontWeight: FontWeight.w500,),),
          SizedBox(height: 10.h,),

        ],
      ),
    );
  }
}



