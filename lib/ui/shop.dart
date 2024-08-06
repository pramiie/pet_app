import 'package:flutter/cupertino.dart';

import 'package:pet_app/ui/subscription_details.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_bnb.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int changeButton=0;
  int changeBorder=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(25.w),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                width: 270.w,
                    child: CommonTextfield(hintText: "Search",
                      prefixIcon: Image.asset("assets/searchicon.png"),
                      suffixIcon: Image.asset("assets/sliders.png"),),
                  ),
                InkWell(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>SubscriptionDetails()));
                    },
                    child: Image.asset("assets/ShoppingCart.png")),
        
                ],
              ),
              SizedBox(height: 25.h,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  RedContainer(data1:'Pamper your pet',
                      data2:'Get monthly deliveries of high-quality, curated pet products for your furry friend!',
                      height:230.h),
                  Image.asset("assets/Ellipse2.png"),
                  Image.asset("assets/Ellipse1.png"),
                  Image.asset("assets/image38.png"),
                ],
              ),

              SizedBox(height: 25.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        changeButton=1;
                      });
                     // Navigator.push(context,
                       //   MaterialPageRoute(builder: (context)=>Product()));
                    },
                    child: Container3(
                      width:changeButton==1?115.w:100.h,
                      color: changeButton==1?Colors.black:Colors.white,
                      child: Text("Product",style: TextStyle(
                          color:changeButton==1?Colors.white: Color(0XFF888888,),
                    fontSize: 14.sp,fontWeight: FontWeight.w500),),),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
        
                      });
                      changeButton=0;
                     // Navigator.push(context,
                       //   MaterialPageRoute(builder: (context)=>Product()));
                    },
                    child: Container3(
                      width: changeButton==0?115.w:105.w,
                      color: changeButton==0?Colors.black:Colors.white,
                      child: Text("Subsription",style: TextStyle(
                         color:changeButton==0?Colors.white: Color(0XFF888888),
                        fontSize: 14.sp,fontWeight: FontWeight.w500),),),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        changeButton=2;
                      });
                     // Navigator.push(context,
                       //   MaterialPageRoute(builder: (context)=>Product()));
                    },
                    child: Container3(
                      width: changeButton==2?115.w:100.w,
                      color: changeButton==2?Colors.black:Colors.white,
                      child: Text("Service",style: TextStyle(
                          color:changeButton==2?Colors.white: Color(0XFF888888,),
                        fontSize: 14.sp,fontWeight: FontWeight.w500),),),
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 14.h,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          changeBorder=1;
                        });
                      },
                      child: Container1(border: changeBorder==1?
                      Border.all(color: Color(0XFFAD2D14),width: 2):Border()),
                    ),
                    SizedBox(height: 25.h,),
                    GestureDetector(
                        onTap: (){
                          setState(() {
                            changeBorder=2;
                          });
                        },
                        child: Container2(border: changeBorder==2? Border.all(color: Color(0XFFAD2D14),width: 2):Border(),)
                    ),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    //  bottomNavigationBar: CommonBnb(),
    );
  }
}
