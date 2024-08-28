import 'package:flutter/scheduler.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';

import '../../../framework/controller/api_controller.dart';
import '../../theme/theme.dart';

import 'common_textfield.dart';


class SubscriptionWidget extends ConsumerStatefulWidget {
  const SubscriptionWidget({super.key});

  @override
  ConsumerState<SubscriptionWidget> createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends ConsumerState<SubscriptionWidget> {
  int changeButton=1;
  String? SelectCity;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cityController).getCity();
    });
  }
  @override
  Widget build(BuildContext context) {
    final cityWatch = ref.watch(cityController);
    List listItem=cityWatch.cityList as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25.h,),
        Text("Select Delivery Method",style: TextStyle(
            color: Color(0XFF767676),fontSize: 16.sp,fontWeight: FontWeight.w600
        ),),
        SizedBox(height: 15.h,),
        Row(
          children: [
            InkWell(
                onTap: (){
                  setState(() {
                    changeButton=1;
                  });},
                child: CommonButton(data: "Pick Up",height: 50.h,width: 110.w,
                  color:changeButton==1?Color(0XFFB12A1C): Color(0XFFD5D5D5),
                  borderRadius: BorderRadius.circular(10.r),)),
            SizedBox(width: 20.w,),
            InkWell(
              onTap: (){
                setState(() {
                  changeButton=2;
                });},
              child: CommonButton(data: "Delivery",height: 50.h,width: 110.w,
                color:changeButton==2?Color(0XFFB12A1C): Color(0XFFD5D5D5),
                borderRadius: BorderRadius.circular(10.r),),
            ),
          ],
        ),
        SizedBox(height: 16.h,),
        Text( "Select Location",style: TextStyle(
            color: Color(0XFF767676),fontSize: 16.sp,fontWeight: FontWeight.w600
        ),),
        SizedBox(height: 14,),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            CommonTextfield(hintText: "Please Select A Location",controller: cityWatch.cityController,),
            Positioned(
              bottom: 10,
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                style: TextStyle(color: Color(0XFF3F434A),fontSize: 14.sp,fontWeight: FontWeight.w500),
                icon: Icon(Icons.keyboard_arrow_down,),
                underline: SizedBox(),
                onChanged: (String? newValue) {
                    setState(() {
                      SelectCity = newValue;
                      cityWatch.cityController.text = newValue!;

                  });
                },
                items: listItem.map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SubscriptionBnb extends StatelessWidget {
  const SubscriptionBnb({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/Top.png"),
          CommonButton(data: "Add To Cart",width: 280.w,
            borderRadius: BorderRadius.circular(10.r),),
          SizedBox(height: 3.h,),
        ],
      ),
    );
  }
}

