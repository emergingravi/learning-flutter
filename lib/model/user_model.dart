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
    'fullname' :fullname,
    'emailAddress':emailaddress,
    'gender':gender,
    'address' :address,
    'phonenumber':phoneNumber,
    'userId':uId,
  };
  }

  factory UserModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> document) {
    final userData = document.data();
    return UserModel(
      fullname: userData['fullname'],
      phoneNumber: userData['phoneNumber'],
      address: userData['address'],
      gender: userData['gender'],
      emailaddress: userData['emailAddress'],

    );}
}