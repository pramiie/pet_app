import '../../../framework/controller/pet_Profile_controller.dart';
import '../../theme/theme.dart';
import '../../utils/widget/common_button.dart';
import '../../utils/widget/common_container.dart';
import '../../utils/widget/common_text.dart';
import '../../utils/widget/common_textfield.dart';
import '../pet_profile2.dart';

class PP1 extends ConsumerStatefulWidget {
  const PP1({super.key});

  @override
  ConsumerState<PP1> createState() => _PP1State();
}

class _PP1State extends ConsumerState<PP1> {
  int changeBorderGender=0;
  int changeBorderPT=0;

  String? selectBreed;
  List listItem=["Domestic Shorthair","Persian","Maine Coon","Siamese"];

  @override

  @override
  Widget build(BuildContext context) {
    final petProfileWatch = ref.watch(petProfileController);
  //  final petProfileRead = ref.read(petProfileController.notifier);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonText2(data: "Pet Name",FontSize: 22.sp,),
        SizedBox(height: 15.6.h,),
        CommonTextfield(hintText: "Enter pet name here",controller: petProfileWatch.petNameCon,),
        SizedBox(height: 20.h,),
        CommonText2(data: "Pet Gender",FontSize: 22.sp,),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap:(){
                petProfileWatch.setGender("Male");
                setState(() {
                  changeBorderGender=1;
                });
              },
              child: ContainerProfile(height: 42.h,width: 138.w,
                data: "Male",
                border:changeBorderGender==1? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
            GestureDetector(
              onTap:(){
                petProfileWatch.setGender("Female");
                setState(() {
                  changeBorderGender=2;

                });
              },
              child: ContainerProfile(height: 42.h,width: 138.w,
                data: "Female",
                border:changeBorderGender==2? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
          ],
        ),
        SizedBox(height: 25.h,),
        CommonText2(data: "Pet Type",FontSize: 22.sp,),
        SizedBox(height: 16.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  changeBorderPT=1;
                petProfileWatch.setPetType("Dog");
                });
              },
              child: ContainerProfile(height: 40.h,width: 138.w,
                data: "Dog",
                border:changeBorderPT==1? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
            GestureDetector(
              onTap:(){
                setState(() {
                  changeBorderPT=2;
                  petProfileWatch.setPetType("Cat");
                });
              },
              child: ContainerProfile(height: 42.h,width: 138.w,
                data: "Cat",
                border:changeBorderPT==2? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
          ],
        ),
        SizedBox(height: 13.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap:(){
                setState(() {
                  changeBorderPT=3;
                  petProfileWatch.setPetType("Hamster");
                });
              },
              child: ContainerProfile(height: 40.h,width: 138.w,
                data: "Hamster",
                border:changeBorderPT==3? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
            GestureDetector(
              onTap:(){
                setState(() {
                  changeBorderPT=4;
                  petProfileWatch.setPetType("Rabit");
                });
              },
              child: ContainerProfile(height: 42.h,width: 138.w,
                data: "Rabit",
                border:changeBorderPT==4? Border.all(color:Color(0XFFB12A1C),width: 2.w ):
                Border.all(color:Color(0XFFE8E8E8),width: 1.w ),
              ),),
          ],
        ),
        SizedBox(height: 15.6.h,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonText2(data: "Breed",FontSize: 22.sp,),
            DropdownButton<String>(
              dropdownColor: Colors.white,
              style: TextStyle(color: Color(0XFF3F434A),fontSize: 14.sp,fontWeight: FontWeight.w500),
              icon: Icon(Icons.keyboard_arrow_down,),
              underline: SizedBox(),
              onChanged: (String? newValue) {
                setState(() {
                  selectBreed = newValue;
                 petProfileWatch.breedCon.text= newValue!;
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


        SizedBox(height: 2.h,),
        CommonTextfield(hintText: "Please Select A Breed",
          controller: petProfileWatch.breedCon,),
        SizedBox(height: 28.h,),
        InkWell(
            onTap: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (contex)=>PetProfile2()));
            },
            child: CommonButton(data: "Next",borderRadius: BorderRadius.circular(10.0.r),))
      ],
    );
  }
}
