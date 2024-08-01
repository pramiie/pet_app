import 'package:pet_app/ui/theme/theme.dart';
import 'package:pet_app/ui/utils/widget/common_textfield.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding:EdgeInsets.all(25.w),
          child: Column(
            children: [
              CommonTextfield(hintText: "Search",width: double.infinity,
                prefixIcon: Image.asset("assets/searchicon.png"),
                suffixIcon: Image.asset("assets/sliders.png"),),

              SizedBox(height: 30.h,),



            ],
          ),
        ),

    );
  }
}
