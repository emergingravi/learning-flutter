import 'package:flutter/material.dart';
import 'package:login/service/firebase_firestore_service.dart';

import 'model/user_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("users List"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestoreService().getAllUsersFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('no user found'),
                );
              }
              if (snapshot.hasData) {
                final usersList = snapshot.data;
                if (usersList != null) {
                  return ListView.builder(
                      itemCount: usersList.length,
                      itemBuilder: (context, index) {
                        final userModelDetails = usersList[index];
                        return BasicDetails(userModel: userModelDetails,);
                      });
                } else {
                  return Center(
                    child: Text('no user found'),
                  );
                }
              }

            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
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
          (userModel!=null)?
          Text('Name: ${userModel!.fullname}'): Text('name: -'),
          SizedBox(
            height: 5,
          ),
          (userModel!=null)?
          Text('Email: ${userModel!.emailaddress}'): Text('email: '),
          SizedBox(
            height: 5,
          ),
          (userModel!=null)?
          Text('Phone: ${userModel!.phoneNumber}'):Text("phone : "),
          SizedBox(
            height: 5,
          ),
          (userModel!=null)?
          Text('Address: ${userModel!.address}'): Text("address: "),
          SizedBox(
            height: 5,
          ),
          (userModel!=null)?
          Text('Gender: ${userModel!.gender}'):Text("gender: "),
        ],
      ),
    );
  }
}