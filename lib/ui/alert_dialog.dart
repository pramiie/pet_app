import 'package:pet_app/ui/theme/theme.dart';

import '../framework/controller/pet_Profile_controller.dart';

class AlertDialogBox extends ConsumerStatefulWidget {
  const AlertDialogBox({super.key,});



  @override
  ConsumerState<AlertDialogBox> createState() => _AlertDialogBox();
}

class _AlertDialogBox extends ConsumerState<AlertDialogBox> {
  bool isLoding=false;

  @override
  Widget build(BuildContext context) {
    final profileWatch=ref.watch(petProfileController);
    return AlertDialog(
      title: const Text("Edit Profile"),
      content: Container(
        height: 370.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: InkWell(
                  onTap: (){
                    profileWatch.pickImageUser(context);
                  },
                  child: profileWatch.userImage!=null?CircleAvatar(
                    radius: 65.r,
                    backgroundImage: FileImage(profileWatch.userImage!),
                  ):Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0XFFB12A1C), width: 3.w),
                    ),
                    child: Icon(Icons.person_3,color:Color(0XFFB12A1C)),
                  ),
                ),
              ),
          
              SizedBox(height: 20.h),
          
              // User Name
              Text(
                "Edit picture",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                controller: profileWatch.userNameCon,
                decoration: InputDecoration(
                  label: Text("Enter Your Name"),
          
                ),
              ),
              SizedBox(height: 10.h,),
              isLoding==true?CircularProgressIndicator():SizedBox(),
              SizedBox(height: 5.h,),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const Text("cancel"),
        ),
        TextButton(
          onPressed: ()async {
            setState(() {
             isLoding =true;
            });

            await profileWatch.onEditButtonSubmit(context);
            setState(() {
             isLoding=false;
            });

            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const Text("save"),
        ),
      ],
    );
  }
}
