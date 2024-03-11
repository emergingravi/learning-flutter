import 'package:flutter/material.dart';
import 'package:login/model/user_model.dart';
import 'package:login/service/firebase_firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  //underscore : private
  final _fullNameController = TextEditingController();

  final _emailAddressController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final _passwordController = TextEditingController();

  final _streetAddressController = TextEditingController();

  final _emailRegexPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  String gender = "Male";

  @override
  void didChangeDependencies() {
    setControllerValuesFromUserModel();
    super.didChangeDependencies();
  }

  ///this function is used to set all controllers with their respective values
  void setControllerValuesFromUserModel() {
    final UserModel? userModelDetails =
        ModalRoute.of(context)!.settings.arguments as UserModel;
    if (userModelDetails != null) {
      if (userModelDetails.fullname != null) {
        _fullNameController.text = userModelDetails.fullname!;
      }
      if (userModelDetails.emailaddress != null) {
        _emailAddressController.text = userModelDetails.emailaddress!;
      }
      if (userModelDetails.phoneNumber != null) {
        _phoneNumberController.text = userModelDetails.phoneNumber!.toString();
      }
      if (userModelDetails.address != null) {
        _streetAddressController.text = userModelDetails.address!;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _fullNameController,
              keyboardType: TextInputType.name,
              maxLength: 30,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter full name',
              ),
              validator: (fullNameValue) {
                if (fullNameValue == null || fullNameValue.trim().isEmpty) {
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
              validator: (emailValue) {
                if (emailValue == null || emailValue.trim().isEmpty) {
                  return 'Please enter your email address';
                }
                final regex = RegExp(_emailRegexPattern);
                if (!regex.hasMatch(emailValue)) {
                  return 'Please enter a valid email';
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
              validator: (phoneNumberValue) {
                if (phoneNumberValue == null ||
                    phoneNumberValue.trim().isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
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
              validator: (streetAddressValue) {
                if (streetAddressValue == null ||
                    streetAddressValue.trim().isEmpty) {
                  return 'Please Enter address';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            Text("\n Select your gender \n"),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Radio(
                  value: "male",
                  groupValue: gender,
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  },
                ),
                Text('Male'),
                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  },
                ),
                Text('Female'),
                Radio(
                  value: "Others",
                  groupValue: gender,
                  onChanged: (newValue) {
                    setState(() {
                      if (newValue != null) {
                        gender = newValue;
                      }
                    });
                  },
                ),
                Text('Others'),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState != null) {
                  if (_formKey.currentState!.validate()) {
                    // final email = _emailAddressController.text;
                    // final password = _passwordController.text;
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final uId = prefs.getString('userId');
                    if (uId != null) {
                      final userModelRequest = UserModel(
                        uId: uId,
                        fullname: _fullNameController.text,
                        emailaddress: _emailAddressController.text,
                        phoneNumber: _phoneNumberController.text,
                        gender: gender,
                        address: _streetAddressController.text,
                      );
                      final updateUserModel = await FirebaseFirestoreService()
                          .updateUserDetailsUsingUID(
                        uId: uId,
                        userModel: userModelRequest,
                      );
                      if (updateUserModel != null) {
                        print("user details updated");
                        Navigator.of(context).pop();
                      }
                    }
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'update',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
