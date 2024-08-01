import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_app/ui/home/home.dart';
import 'package:pet_app/ui/home/product_details.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/home/helper/home_product.dart';

import '../../framework/model/product_model.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText2(data: 'Products..!',FontSize: 26.sp,),
    leading: IconButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Bnb()),
    );
    },
    icon:Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.w), // Adjust padding as needed
        child: (ProductModel.items != null && ProductModel.items!.isNotEmpty)
            ? GridView.builder(
          itemCount: ProductModel.items!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            mainAxisSpacing: 30.h,
            mainAxisExtent: 300.h,
           // childAspectRatio: 0.75, // Adjust aspect ratio as needed
          ),
          itemBuilder: (context, index) {
           // final product=ProductModel.getByPosition(index);
            final product=ProductModel.items![index];
            return  InkWell(
                onTap: ()=>Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>ProductDetails(item: product))),
                child: HomeProduct(item: product));
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
