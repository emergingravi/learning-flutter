import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  final _formkey = GlobalKey<FormState>();
  final _Username = TextEditingController();
  final _password = TextEditingController();


  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  bool? _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://t3.ftcdn.net/jpg/03/55/60/70/240_F_355607062_zYMS8jaz4SfoykpWz5oViRVKL32IabTP.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Form(
              key: widget._formkey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: widget._Username,
                        keyboardType: TextInputType.emailAddress,
                        maxLength: 20,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(), labelText: "username "),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: widget._password,
                        obscureText: true,
                        maxLength: 20,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(), labelText: "password"),
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
                              onPressed: () {},
                              child: Text("login"),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.blue,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.3,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("signup"),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.green,
                              ),
                            ),
                          ),
                          FractionallySizedBox(
                            widthFactor: 0.3,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("reset"),
                              style:ElevatedButton.styleFrom(
                                backgroundColor:Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(onPressed: (){
                        if(_isChecked!=null){
                          if(_isChecked!){
                            Navigator.of(context).pushNamed('/listviewpage');
                          }
                          else{
                            print('check once');
                          }
                        }
                      }, child: Text("listViewPage"),),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}