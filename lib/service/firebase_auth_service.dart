
import 'package:firebase_auth/firebase_auth.dart';

//this function is for creating a user in firebase using email and password
class FirebaseAuthService {
  final _auth = FirebaseAuth.instance;
  Future<User?> signUpUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("something went wrong $e");
      return null;
    }
  }

//this function is for login user with email and password
  Future<User?> signInUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print("something went wrong $e");
      return null;
    }
  }

  //this function is for logout user from firebase
  void signOutUser() async {
    try {
      await _auth.signOut();
    } catch(e){
      print("error signing out :: "+ e.toString());
    }
  }
  Future<User?>getLogggedInUser()async{
    User? user = await _auth.authStateChanges().first;
    return user;
  }
}
