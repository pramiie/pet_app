import 'package:flutter/cupertino.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';

import '../../../framework/model/product_model.dart';
import '../../theme/theme.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key, this.item});
  final Item? item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10.w),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: Color(0XFFEFEFEF),
              ),
           child: Hero(
               tag:Key("${item!.id}"),
               //child: Image.network(item!.image, fit: BoxFit.cover,)
    child: CachedNetworkImage(
      imageUrl: item!.image,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) => Container(
      //  width: 150.0,
       // height: 150.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
           ),
          ),
        ),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 8.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item!.name,style: TextStyle(
            color: Color.fromRGBO(151, 151, 151, 1),
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),),
          Row(
            children: [
              Image.asset("assets/Vector.png"),
              SizedBox(width: 3.w),
              Text("${item!.star}",style: TextStyle(color: Color(0XFFABABAB)),),
            ],
          )
        ],
      ),
    SizedBox(height: 9.h,),
    CommonText2(data: item!.desc,FontSize: 12.sp,),
    SizedBox(height: 12.h,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(data: "\$${item!.price}",fontSize: 18.sp,),
          Text(item!.day,style: TextStyle(
            color: Color.fromRGBO(151, 151, 151, 1),
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),),
        ],
      )],
    )
      ],
    );
    
  }
}
