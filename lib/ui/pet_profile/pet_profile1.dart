import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pet_app/ui/home/home.dart';
import 'package:pet_app/ui/pet_profile/helper/pp1.dart';
import 'package:pet_app/ui/pet_profile/pet_profile2.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../framework/controller/pet_Profile_controller.dart';




class PetProfile1 extends ConsumerWidget {
  PetProfile1({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final petProfileWatch=ref.watch(petProfileController);
    return Scaffold(
      appBar: AppBar(
          title: CommonText2(data: "Pet Profile"),
          centerTitle: true,
          actions: [
            SizedBox(height: 60.h,),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>Bnb()));
                },
              child: CommonText(data: "Skip",),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child:Form(
          key: petProfileWatch.petKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h,),
              Text("1 of 2"),
              SizedBox(height: 16,),
              Image.asset("assets/ProgressBar.png"),
              SizedBox(height: 34.h,),
              //profile image
              GestureDetector(
                onTap: (){
                  petProfileWatch.pickImageFile(context);

                },
                  child: petProfileWatch.selectedImage==null?ContainerProfile(data: 'Add Photo', height: 111.h, width: 122.w,):
                  Container(height: 111.h,width: 122.w, decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Image.file(petProfileWatch.selectedImage!,height:111.h ,fit: BoxFit.cover,))),

              SizedBox(height: 8.h,),
              Padding(
                // padding: EdgeInsets.all(47.w),
                padding: EdgeInsets.symmetric(horizontal: 47.w),
                child:PP1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
