
import 'package:pet_app/ui/subscription.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_button.dart';
import 'package:pet_app/ui/utils/widget/common_container.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';
import 'package:pet_app/ui/utils/widget/subscription_widget.dart';

class SubscriptionDetails extends StatefulWidget {
  const SubscriptionDetails({super.key, this.changeBorder});
  final int? changeBorder;

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubscriptionPage()),
            );
          },
          icon:Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: CommonText2(data: "Subscription Details",FontSize: 24.sp,),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubscriptionPage()),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              widget.changeBorder==2? Container2():Container1(),
              SubscriptionWidget(),
          
              SizedBox(height: 16.h,),
              Text( "Additional Request",style: TextStyle(
                  color: Color(0XFF767676),fontSize: 14.sp,fontWeight: FontWeight.w600
              ),),
              SizedBox(height: 14.h,),
              CommonTextfield(maxLines: 6,hintText: "",),
              SizedBox(height: 30.h,),
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
              SizedBox(height: 10.h,),
          
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: SubscriptionBnb(),

    );
  }
}
