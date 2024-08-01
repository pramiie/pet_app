import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:pet_app/framework/model/user_model.dart';
import 'package:pet_app/framework/service/firebase_store_service.dart';
import 'package:pet_app/ui/pet_profile/pet_profile1.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/home/helper/product_list.dart';
import 'package:pet_app/ui/home/digital_card.dart';
import '../../framework/model/product_model.dart';
import 'package:pet_app/ui/home/see_all.dart';
import 'package:pet_app/ui/subscription.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';


class Home extends StatefulWidget {
  const Home({super.key});


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    loadData();

  }


  loadData()async{
    await Future.delayed(Duration(seconds: 2));
    final producJson=await rootBundle.loadString("assets/products_model.json");
    final decodData= jsonDecode(producJson);//string to map(json)
    final productsData = decodData["products"];
    ProductModel.items =List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DigitalCard()),
            );
          },
          icon: Image.asset("assets/Card.png"),
        ),
        centerTitle: true,
        title: CommonText2(data: "Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()),
              );
            },
            icon: Image.asset("assets/Top.png"),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.0.w),
              height: 255.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF404E7E),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0.r),
                child: StreamBuilder<UserModel>(
                  stream: FireStoreService.fireStoreService.getUserStream(),
                   builder: (context,snapshot){
                    final pet= snapshot.data;
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),);
                    }else if(snapshot.hasData){
                      return  Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${pet!.petName}'s Summary",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              RichText(
                                text: TextSpan(
                                  text: "Type: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:pet.type ,
                                      style: TextStyle(
                                        color: Color(0XFFF0F0F0),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),
                              RichText(
                                text: TextSpan(
                                  text: "Breed: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:pet.breed,
                                      style: TextStyle(color: Color(0XFFF0F0F0),fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Gender: ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: pet.gender,
                                              style: TextStyle(
                                                color: Color(0XFFF0F0F0),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      RichText(
                                        text: TextSpan(
                                          text: "Age: ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: pet.age,
                                              style: TextStyle(
                                                color: Color(0XFFF0F0F0),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(width: 12.h),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          text: "Diet: ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: pet.diet,
                                              style: TextStyle(
                                                color: Color(0XFFF0F0F0),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6.h),
                                      RichText(
                                        text: TextSpan(
                                          text: "Condition: ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: pet.condition,
                                              style: TextStyle(
                                                color: Color(0XFFF0F0F0),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              RichText(
                                text: TextSpan(
                                  text: "Weight: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: pet.weight,
                                      style: TextStyle(
                                        color: Color(0XFFF0F0F0),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          //2nd Column
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 25.h,),
                              CircleAvatar(backgroundColor: Colors.grey,radius: 55.r,
                                backgroundImage:NetworkImage(pet.imageUrl.toString()),),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context)=>PetProfile1()));
                                  },
                                  child: CommonButton(data: "data change",height: 33.h,width: 100.w,)),
                            ],
                          )
                        ],
                      );
                    }else{
                      return const Center(child: Text("No data found"),);
                    }
                   }
                                   ),

              ),
            ),

            SizedBox(height: 38.h),


            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText2(
                      data: "Recommended Products",
                      FontSize: 22.sp,
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>SeeAll()));
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          color: Color.fromRGBO(151, 151, 151, 1),
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  "Based on previous purchases and similar pet owners",
                  style: TextStyle(
                    color: Color.fromRGBO(151, 151, 151, 1),
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Expanded(
              child:(ProductModel.items != null&& ProductModel.items!.isNotEmpty)?
              ProductList():Center(
                child: CircularProgressIndicator(),
              ),),

          ],
        ),
      ),
    );
  }
}




