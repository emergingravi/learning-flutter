import 'package:get/get.dart';
import 'package:login/model/user_model.dart';
import 'package:login/service/firebase_firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController{
 var usermodel = UserModel().obs;
 var uid = "".obs;
 final firebaseFirestoreService = FirebaseFirestoreService();

 @override
  void onReady() {
   getUserUidFromSharedPrefences();
    super.onReady();
  }

 void getUserUidFromSharedPrefences() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   String? id = prefs.getString('userId');
  if(id!=null){
    uid.value =id;
  }
   getUserDetailsFromFirebaseUsingUID();
 }
 getUserDetailsFromFirebaseUsingUID()async{
   UserModel? userDetails;
   userDetails = await firebaseFirestoreService.getUserDetailsFromUseruId(uId: uid.value);
   if (userDetails!=null){
     usermodel.value = userDetails;
   }
 }
}