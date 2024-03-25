import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          firebaseFireStore.collection('users');
      await _userCollection
          .add(userModel.toJson())
          .whenComplete(() => print('User Created successfull !'));
    } catch (e) {
      print('something went wrong\n ');
    }
  }

  Future<UserModel?> getUserDetailsFromUseruId({required String uId}) async {
    try {
      CollectionReference _userCollection =
          await firebaseFireStore.collection('users');
      final documentSnapshot =
          await _userCollection.where('userId', isEqualTo: uId).get();
      if (documentSnapshot.docs.isNotEmpty) {
        final userModel = await documentSnapshot.docs
            .map((doc) => UserModel.fromJson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .single;
        return userModel;
      } else {
        print('document not found');
      }
    } catch (e) {
      print('something went wrong');
    }
    return null;
  }

  ///function to get all the user from database
  Future<List<UserModel>> getAllUsersFromDatabase() async {
    try {
      CollectionReference _usersCollection =
          await firebaseFireStore.collection("users");
      final snapshot = await _usersCollection.get();

      final usersList = snapshot.docs
          .map((doc) => UserModel.fromJson(
              doc as QueryDocumentSnapshot<Map<String, dynamic>>))
          .toList();
      return usersList;
    } catch (e) {
      print("error in getalluserfrom database function");
    }
    return [];
  }

  ///function to update userdetails in firestoreDB
  Future<UserModel?> updateUserDetailsUsingUID(
      {required String uId, required UserModel userModel}) async {
    try {
      CollectionReference _usersCollection =
          await firebaseFireStore.collection("users");
      final snapshot = await _usersCollection.get();
      if (snapshot.docs.isNotEmpty) {
        final documentId = snapshot.docs.first.id;
        _usersCollection.doc(documentId).update(userModel.toJson());
        final userModelUpdated = await snapshot.docs
            .map((doc) => UserModel.fromJson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .single;
        return userModelUpdated;
      } else {
        return null;
      }
    } catch (e) {
      print("something went wrong");
    }
    return null;
  }

  ///delete user from the database
  Future<List<UserModel>> deleteUserFromFirebaseUsingUID(
      {required String uId}) async {
    try {
      CollectionReference _usersCollection =
          await firebaseFireStore.collection("users");
      final snapshot =
          await _usersCollection.where('userId', isEqualTo: uId).get();
      if (snapshot.docs.isNotEmpty) {
        final documentId = snapshot.docs.first.id;
        await _usersCollection.doc(documentId).delete();
        final usersList = snapshot.docs
            .map((doc) => UserModel.fromJson(
                doc as QueryDocumentSnapshot<Map<String, dynamic>>))
            .toList();
        return usersList;
      } else {
        print('error from delete function');
      }
    } catch (e) {
      print('error from delete user function');
    }
    return [];
  }
}
