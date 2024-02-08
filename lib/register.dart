import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final _formKey= GlobalKey<FormState>(); //underscore : private
  final _fullNameController=TextEditingController();
  final _emailAddressController=TextEditingController();
  final _phoneNumberController=TextEditingController();
  final _passwordController=TextEditingController();
  final _streetAddressController=TextEditingController();
  final _emailRegexPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10,top: 20),
            width: MediaQuery.of(context).size.width/1.5,
            child: Column(
              children: [
                TextFormField(
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  maxLength: 30,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter full name',
                  ),
                  validator: (fullNameValue){
                    if (fullNameValue==null || fullNameValue.trim().isEmpty){
                      return 'Please Enter Full Name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _emailAddressController,
                  maxLength: 30,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email address',
                  ),
                  validator: (emailValue){
                    if (emailValue==null || emailValue.trim().isEmpty){
                      return 'Please enter your email address';
                    }
                    final regex= RegExp(_emailRegexPattern);
                    if (!regex.hasMatch(emailValue)){
                      return'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your phone number',
                  ),
                  validator: (phoneNumberValue){
                    if (phoneNumberValue==null || phoneNumberValue.trim().isEmpty){
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  maxLength: 20,
                  obscureText: true,  //making non visible password
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your password',
                  ),
                  validator: (passwordValue){
                    if (passwordValue==null || passwordValue.trim().isEmpty){
                      return 'Please Enter password';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: _streetAddressController,
                  keyboardType: TextInputType.streetAddress,
                  maxLength: 20,
                  maxLines: 4, //lines or height of box
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your address',
                  ),
                  validator: (streetAddressValue){
                    if (streetAddressValue==null || streetAddressValue.trim().isEmpty){
                      return 'Please Enter address';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                ListTile(title: Text('This is title.'),subtitle: Text('This is subtitle.'),leading: Image.network('https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-1080x675.jpg'),),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!=null){
                      if (_formKey.currentState!.validate()){
                        print('The Enter First Name ${_fullNameController.text}');
                        print('The email address is  ${_emailAddressController.text}');
                        print('The Enter phone number ${_phoneNumberController.text}');
                        print('The password is ${_passwordController.text}');
                        print('The street address ${_streetAddressController.text}');
                      }
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Submit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),

                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}