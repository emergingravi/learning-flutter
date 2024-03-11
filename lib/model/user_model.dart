import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String? fullname;
  String? emailaddress;
  String? phoneNumber;
  String? address;
  String? gender;
  String? uId;

  UserModel({
    this.fullname,
    this.emailaddress,
    this.phoneNumber,
    this.address,
    this.gender,
    this.uId,
  });

  toJson(){
  return{
    'full_name' :fullname,
    'email_address':emailaddress,
    'gender':gender,
    'address' :address,
    'phone_number':phoneNumber,
    'userId':uId,
  };
  }

  factory UserModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final userData = document.data();
    return UserModel(
      fullname: userData['full_name'],
      phoneNumber: userData['phone_number'],
      address: userData['address'],
      gender: userData['gender'],
      emailaddress: userData['email_address'],

    );}
}