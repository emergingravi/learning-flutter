import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CounterController extends GetxController{
  var counter = 0.obs;
  var counter1 = 0;
  var sampleList = [].obs;
  var isChecked =false.obs;

  changeButtonCheck(bool newValue){
    isChecked.value=newValue;
  }

  increment(){
    counter++;
    print("counter value increased by 1 .== $counter");
  }
  decrement(){
    counter--;
    print("counter value decremented by 1 . == $counter");
  }
}