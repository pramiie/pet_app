import 'package:pet_app/ui/home/home.dart';
import 'package:pet_app/ui/subscription_details.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';


class SubscriptionPage extends StatefulWidget {
   const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int changeBorder=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
        onTap: (){ Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const Bnb()));},
            child: const Icon(Icons.arrow_back_outlined,color: Colors.grey,)),
        actions: [
          IconButton(onPressed: ( ){
            Navigator.push(context,
                MaterialPageRoute(builder: (contex)=>const Bnb()));
          }, icon: Icon(Icons.cancel,color: const Color(0XFF979797),))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(34.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonText2(data: "Subscribe to PetBox ",FontSize: 26.sp,),
            SizedBox(height: 10.h,),
            Text("Subscribe to our monthly pet product box, tailored specifically to your furry friend’s needs and preferences.",textAlign: TextAlign.center,
              style: TextStyle(color: Color(0XFFABABAB),fontSize: 17.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 42.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText2(data: "Select your subscription",FontSize: 20.sp,),
                SizedBox(height: 14.h,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      changeBorder=1;
                    });
                  },
                  child: Container1(border: changeBorder==1?
                  Border.all(color: Color(0XFFAD2D14),width: 2.w):Border()),
                ),
                SizedBox(height: 25.h,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      changeBorder=2;
                    });
                  },
                  child: Container2(border: changeBorder==2?
                  Border.all(color: Color(0XFFAD2D14),width: 2.w):Border(),)
                ),
                SizedBox(height: 26.h,),
                InkWell(child: CommonButton(data: "Subscribe"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder:
                          (contex)=>SubscriptionDetails(changeBorder: changeBorder.toInt(),)));
                },),
                SizedBox(height: 35.h,),


              ],        ),
            Image.asset("assets/p&p.png"),
          ],
        ),
      ),

    );
  }
}
