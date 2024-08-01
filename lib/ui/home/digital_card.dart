import 'package:pet_app/ui/home/home.dart';
import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_bnb.dart';
import 'package:pet_app/ui/utils/widget/common_text.dart';

class DigitalCard extends StatelessWidget {
  const DigitalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFFB12A1C),
        leading: InkWell(
            onTap: (){ Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Bnb()));},
            child: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
        centerTitle: true,
        title: Text("Digital Card"),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 22.sp,fontWeight: FontWeight.w600),
      ),
      body: Column(
        children: [
          Container(
              color:  Color(0XFFB12A1C),
              width: double.infinity,
              height: 300,
              child: Image.asset("assets/Background.png")),
          SizedBox(height: 44.h,),
          Image.asset("assets/image32.png"),
          CommonText(data: "Scan In-store to Collect Rewards",decoration: TextDecoration.underline,)
        ],
      ),
      bottomNavigationBar:CommonBnb(selectedIndex: 0),
    );
  }
}
