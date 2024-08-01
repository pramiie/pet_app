import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';

class Insight extends StatefulWidget {
  const Insight({super.key});

  @override
  State<Insight> createState() => _InsightState();
}

class _InsightState extends State<Insight> {
  int changeButton=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     body: Padding(
       padding: EdgeInsets.all(25.0.w),
       child: Column(
         children: [
           SizedBox(height: 10,),
           CommonText2(data: "Insights"),
           SizedBox(height: 20,),
           Stack(
             alignment: Alignment.bottomRight,
             children: [
               RedContainer(data1: 'Leo’s Data', data2: 'Letting data talk for your pet.',
                 height: 124.h,),
               Image.asset("assets/Ellipse3.png",),
               Image.asset("assets/Ellipse4.png",),
               Image.asset("assets/Ellipse5.png"),
             ],
           ),
           SizedBox(height: 30.h,),
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
                   width:162.w,
                   color: changeButton==1?Colors.black:Colors.white,
                   child: Text("Health",style: TextStyle(
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
                   width:162.w,
                   color: changeButton==0?Colors.black:Colors.white,
                   child: Text("Monitoring",style: TextStyle(
                       color:changeButton==0?Colors.white: Color(0XFF888888),
                       fontSize: 14.sp,fontWeight: FontWeight.w500),),),
               ),
             ],
           ),
           SizedBox(height: 25.h,),
         ],
       ),
     ),
    );
  }
}
