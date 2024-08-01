import 'dart:io';
import 'package:pet_app/framework/model/user_model.dart';
import 'package:pet_app/ui/theme/theme.dart';
import '../service/firebase_singleton.dart';
import '../service/firebase_storage.dart';
import '../service/firebase_store_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

final petProfileController=ChangeNotifierProvider((ref) => PetProfileController());
class PetProfileController extends ChangeNotifier{
  final GlobalKey<FormState> petKey= GlobalKey();
  final TextEditingController petNameCon = TextEditingController();


  File? selectedImage;
  String? fileName;

  pickImageFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']);
    if (result != null) {
      final fileName = result.files.single.name;
      this.fileName = fileName;
      selectedImage = File(result.files.single.path!);
      notifyListeners();
    } else {
      if (context.mounted) {
      }
    }
    notifyListeners();
  }
  /*String gender = "none";
  void pickGender(int index){
    if(index ==1){
      gender ="Male";
    }else{
      gender = "Female";
    }
  }*/
  String selectedGender = '';
  void setGender(String gender) {
    selectedGender = gender;
    notifyListeners();
  }
  String selectedPetType = '';
  void setPetType(String petType) {
    selectedPetType = petType;
    notifyListeners();
  }
  final TextEditingController breedCon = TextEditingController();
  void setBreed(String breed) {
    breedCon.text = breed;
    notifyListeners();
  }
  //petProfile 2
  final ageController=TextEditingController();
  final  weightController =TextEditingController();
  final  conditionController =TextEditingController();

  String selectedDiet = '';
  void setDiet(String diet) {
    selectedDiet = diet;
    notifyListeners();
  }

  onNextButtonSubmit(BuildContext context) async  {
    final imgUrl = await FirebaseStorage.firebaseStorage
        .upLoadImage(context, selectedImage!)??" ";
    //final userEmail = FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!.email;
    final uid = FirebaseSingleTon.firebaseSingleTon.firebaseAuth.currentUser!.uid;

    final user = UserModel(imageUrl:imgUrl, uid:uid,petName:petNameCon.text,gender: selectedGender,
      type:selectedPetType, breed: breedCon.text,age: ageController.text,weight: weightController.text,
   diet:selectedDiet, condition: conditionController.text);
     await FireStoreService.fireStoreService.updateUserToFirebase(user: user);
    notifyListeners();
    }
}

