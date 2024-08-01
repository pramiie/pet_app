import 'package:pet_app/ui/home/home.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';
import '../../framework/controller/pet_Profile_controller.dart';



class PetProfile2 extends ConsumerStatefulWidget {
  const PetProfile2({super.key,});



  @override
  ConsumerState<PetProfile2> createState() => _PetProfile2State();
}

class _PetProfile2State extends ConsumerState<PetProfile2> {
  int changeBorder=0;

  String diet ='';
  String? Selectcondiotion;
  List listItem=["None","1","2","3"];

  @override
  Widget build(BuildContext context) {
    final petProfileWatch = ref.watch(petProfileController);
    return Scaffold(
      appBar: AppBar(
          title: CommonText2(data: "Pet Profile"),
          centerTitle: true,
          actions: [
            SizedBox(height: 60.h,),
            TextButton(
              onPressed: () {
                // Handle skip action
              },
              child: CommonText(data: "Skip",),
            ),
          ]
      ),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h,),
            Text("1 of 2"),
            SizedBox(height: 16,),
            Image.asset("assets/ProgressBar2.png"),
            SizedBox(height: 46.h,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 45),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 CommonText2(data: "Birth Date",FontSize: 22.sp,),
                 SizedBox(height: 10.h,),
                 CommonTextfield(hintText: "DD / MM / YYYY",controller: petProfileWatch.ageController,),
                 SizedBox(height: 20.h,),
                 CommonText2(data: "Weight (kg)",FontSize: 22.sp,),
                 SizedBox(height: 10.h,),
                 CommonTextfield(hintText: "Enter weight",controller: petProfileWatch.weightController,),
                 SizedBox(height: 20.h,),
                 CommonText2(data: "Current Diet",FontSize: 22.sp,),
                 SizedBox(height: 10.h,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     GestureDetector(
                       onTap:(){
                         setState(() {
                           changeBorder=1;
                           petProfileWatch.setDiet("Wet Food");
                         });
                       },
                       child: ContainerProfile(height: 35.h,width: 90.w,
                         data: "Wet Food",
                         border:changeBorder==1? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                         Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
                       ),),
                     GestureDetector(
                       onTap:(){
                         setState(() {
                           changeBorder=2;
                           petProfileWatch.setDiet("Dry Food");
                         });
                       },
                       child: ContainerProfile(height: 35.h,width: 90.w,
                         data: "Dry Food",
                         border:changeBorder==2? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                         Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
                       ),),
                     GestureDetector(
                       onTap:(){
                         setState(() {
                           changeBorder=3;
                           petProfileWatch.setDiet( "Mix");
                         });
                       },
                       child: ContainerProfile(height: 35.h,width: 90.w,
                         data: "Mix",
                         border:changeBorder==3? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                         Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
                       ),),
                   ],
                 ),
                 SizedBox(height: 20,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CommonText2(data: "Pre-existing Conditions",FontSize: 22.sp,),
                     DropdownButton<String>(
                       dropdownColor: Colors.white,
                       style: TextStyle(color: Color(0XFF3F434A),fontSize: 14.sp,fontWeight: FontWeight.w500),
                       icon: Icon(Icons.keyboard_arrow_down,),
                       underline: SizedBox(),
                       onChanged: (String? newValue) {
                         setState(() {
                           Selectcondiotion = newValue;
                           petProfileWatch.conditionController.text = newValue!;
                         });
                       },
                       items: listItem.map<DropdownMenuItem<String>>((value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                         );
                       }).toList(),
                     ),
                   ],
                 ),

                 SizedBox(height: 10,),

                 CommonTextfield(hintText: "Select Conditions",
                   controller: petProfileWatch.conditionController,),
                 SizedBox(height: 186,),
                 InkWell(
                   onTap: ()async{
                     //petDetails update on firebase
                     await petProfileWatch.onNextButtonSubmit(context);

                     Navigator.push(context,
                         MaterialPageRoute(builder: (contex)=>Bnb()));                     },
                     child: CommonButton(data: "Next",
                       borderRadius: BorderRadius.circular(10.0.r),))
               ],
             ),
           )

          ],
        ),
      ),
    );
  }


}

