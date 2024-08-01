import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/ui/home/see_all.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/subscription_widget.dart';

import '../../framework/model/product_model.dart';
import 'home.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.item});
  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SeeAll()),
            );
          },
          icon:Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: CommonText2(data: "Product Details",FontSize: 24.sp,),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bnb()),
              );
            },
            icon: Container(
                height: 46.h,
                width: 46.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0XFFEFEFEF),
                ),
                child: Image.asset("assets/heart.png")),
          ),
          SizedBox(width: 2.w,)
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0XFFEFEFEF),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Hero(
                    tag:Key("${item!.id}"),
                    child: Image.network(item!.image,)),
              ),
              Padding(
                padding: EdgeInsets.all(2.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item!.name,style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),),
                        Row(
                          children: [
                            Image.asset("assets/Vector.png"),
                            SizedBox(width: 3.w),
                            Text("${item!.star}",style: TextStyle(color: Color(0XFFABABAB),fontSize: 14.sp,fontWeight: FontWeight.w500),),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 9.h,),
                    CommonText2(data: item!.desc,FontSize: 16.sp,),
                    SizedBox(height: 12.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonText(data: "\$${item!.price}",fontSize: 22.sp,),
                        Text(item!.day,style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),),
                      ],
                    ),
                  SubscriptionWidget(),
                    SizedBox(height: 10.h,),
                    Card(
                      shadowColor: Color(0XFFE5E5E5),
                      surfaceTintColor: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                      child: ListTile(title: CommonText2(data: 'Description',FontSize: 16,),
                        trailing: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                    Card(
                      shadowColor: Color(0XFFE5E5E5),
                      surfaceTintColor: Colors.white,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.r),
                      ),
                      child: ListTile(title: CommonText2(data: 'Reviews (245)',FontSize: 16,),
                        trailing: Icon(Icons.keyboard_arrow_down_sharp),
                      ),
                    ),
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: SubscriptionBnb(),
    );
  }
}
