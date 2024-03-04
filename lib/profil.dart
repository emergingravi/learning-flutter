import 'package:flutter/material.dart';
import 'package:login/service/firebase_firestore_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String uid = "";
  @override
  void initState() {
    getUserUidFromSharedPrefences();
    super.initState();
  }

  void getUserUidFromSharedPrefences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? id = prefs.getString('userId');
    setState(() {
      uid = id ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('View Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: (uid.isNotEmpty)
            ? FutureBuilder(
                future: FirebaseFirestoreService()
                    .getUserDetailsFromUseruId(uId: uid),
                builder: (context, snapshot) {
                  //if connection is established but  firebase returns an error
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("error loading profile"),
                      );
                    }
                    //if connection is established and firebase returns data
                    if (snapshot.hasData) {
                      return ListView(
                        children: [
                          ProfileImage(),
                          SizedBox(
                            height: 20,
                          ),
                          BasicDetails(),
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
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })
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
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/profile.jpg'),
      ),
    );
  }
}

///This is the widget for displaying the basic details of the user
class BasicDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
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
          Text('Name: '),
          SizedBox(
            height: 5,
          ),
          Text('Email: '),
          SizedBox(
            height: 5,
          ),
          Text('Phone: '),
          SizedBox(
            height: 5,
          ),
          Text('Address: '),
          SizedBox(
            height: 5,
          ),
          Text('Gender: '),
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
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
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
