import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/service/firebase_auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({super.key});
  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  bool? _isChecked = false;
  final _formkey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  @override
  void initState() {
    print('init state called');
    checkedLoggedInUser();
    super.initState();
  }

  //this function is used to check if the user is already logged in or not ,
  //if the user is already logged in then firebase session exists ans user object is not null
  //else user object is null so it says in login page itself and user has to login with credentials
  void checkedLoggedInUser()async{
    final firebaseAuthService = FirebaseAuthService();
    final user = await firebaseAuthService.getLogggedInUser();
    if(user!=null){
      final SharedPreferences prefs = await SharedPreferences.getInstance();
       await prefs.setString('userId',user.uid);
       Navigator.of(context).pushNamed('/profile');
       print('user is signed in');
    }
    else{
      print('user is logged out');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(color: Colors.blueGrey,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage('https://t3.ftcdn.net/jpg/03/55/60/70/240_F_355607062_zYMS8jaz4SfoykpWz5oViRVKL32IabTP.jpg'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
            ),
            Form(
              key:_formkey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller:_emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 40,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.black45,
                            border: OutlineInputBorder(), labelText: "email "),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller:_passwordcontroller,
                        obscureText: true,
                        maxLength: 20,

                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(),
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [

                          FractionallySizedBox(
                            widthFactor: 0.10,
                            child: Checkbox(
                              value: _isChecked,
                              onChanged: (newvalue) {
                                setState(() {
                                  _isChecked = newvalue;
                                });
                                print('the value of Checkbox $newvalue');
                              },
                            ),
                          ),
                          FractionallySizedBox(
                              widthFactor: 0.9,
                              child: Text("Agree to all the terms and condition of the company ? if any querry contact us ...",))
                        ],
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        children: [
                          FractionallySizedBox(
                            widthFactor: 0.3,
                            child: ElevatedButton(
                              onPressed: () async {
                                if(_isChecked!=null){
                                  if(_isChecked!){
                                    final firebaseAuthService = FirebaseAuthService();
                                    final email = _emailcontroller.text;
                                    final password =_passwordcontroller.text;
                                    final User? user = await firebaseAuthService.signInUserWithEmailAndPassword(email, password);

                                    if (user!=null){
                                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                                      await prefs.setString('userId',user.uid);
                                      print("login success");
                                    }
                                    else{
                                      print("login failure ");
                                    }
                                    Navigator.of(context).pushReplacementNamed('/profile');
                                  }
                                  else{
                                    print('check once');
                                  }
                                }
                              },
                              child: Text("login"),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.blue,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text("register"),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}