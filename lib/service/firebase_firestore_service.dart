import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user_model.dart';

class FirebaseFirestoreService {
  final firebaseFireStore = FirebaseFirestore.instance;
  final usersList = [];

  Future getSingleUser() async {
    try {
      CollectionReference _userCollection =
          await firebaseFireStore.collection('users');
      final userDoc = await _userCollection.doc('user1').get();
      if (userDoc.exists) {
        print('the user details is ${userDoc.data()}');
      } else {
        print("user does not exist ");
      }
    } catch (e) {
      print('error getting user details');
    }
  }

//this function is used to get all users from collection
  Future getAllUsersInACollection() async {
    try {
      CollectionReference _userCollection =
          await firebaseFireStore.collection('users');
      await _userCollection.get().then((querySnapShot) {
        for (var doc in querySnapShot.docs) {
          usersList.add(doc.data());
        }
      });
      return usersList;
    } catch (e) {
      print("error getting users $e ");
    }
  }

  //this function is used to create user with email and password
  void signUpUser({required UserModel userModel}) async {
    try {
      CollectionReference _userCollection =
          await firebaseFireStore.collection('users');
      await _userCollection
          .add(userModel.toJson)
          .whenComplete(() => print('User Created sucessfull !'));
    } catch (e) {
      print('something went wrong\n ');
    }
  }

  Future<UserModel?> getUserDetailsFromUseruId({required String uId}) async {
    try {
      CollectionReference _userCollection =
          await firebaseFireStore.collection('users');
      final documentSnapshot =
          await _userCollection.where('id', isEqualTo: uId).get();
      if (documentSnapshot.docs.isNotEmpty) {
        final userModel =  documentSnapshot.docs.map((doc) => UserModel.fromJson(doc as QueryDocumentSnapshot<Map<String, dynamic>>)).first;
        return userModel;
      }else{
        print('document not found');
      }
    } catch (e) {
      print('something went wrong');
    }
    return null;
  }

}
