import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/user_controller.dart';
import 'package:login/model/user_model.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('View Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () => Navigator.of(context).pushNamed('/userslist'),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: (userController.uid.value.isNotEmpty)
            ? Obx(() {
                return ListView(
                          children: [
                ProfileImage(),
                SizedBox(
                  height: 20,
                ),
                BasicDetails(
                  userModel: userController.usermodel.value,
                ),
                SizedBox(
                  height: 20,
                ),
                MenuWidgets(
                  title: 'Settings',
                  onPressed: () {
                    print('Settings Clicked');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                MenuWidgets(
                  title: 'Notifications',
                  onPressed: () {
                    print('Notifications Clicked');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                MenuWidgets(
                  title: 'About App',
                ),
                          ],
                        );
              }
            )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

///This widget is used to display the circular profile images
class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  BasicDetails({required this.userModel});

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black45,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(
              0,
              3,
            ), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (userModel != null)
              ? Text('Name: ${userModel!.fullname}')
              : Text('name: -'),
          SizedBox(
            height: 5,
          ),
          (userModel != null)
              ? Text('Email: ${userModel!.emailaddress}')
              : Text('email: '),
          SizedBox(
            height: 5,
          ),
          (userModel != null)
              ? Text('Phone: ${userModel!.phoneNumber}')
              : Text("phone : "),
          SizedBox(
            height: 5,
          ),
          (userModel != null)
              ? Text('Address: ${userModel!.address}')
              : Text("address: "),
          SizedBox(
            height: 5,
          ),
          (userModel != null)
              ? Text('Gender: ${userModel!.gender}')
              : Text("gender: "),
          SizedBox(
            height: 5,

          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pushNamed('/edit_profile',arguments:userModel),
              child: Text("edit profile"),)
        ],
      ),
    );
  }
}

///This widget is common for creating menus
class MenuWidgets extends StatelessWidget {
  MenuWidgets({required this.title, this.onPressed});

  String title;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black45,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(
                0,
                3,
              ), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
