import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/counter_controller.dart';
import 'package:login/service/firebase_auth_service.dart';
import 'package:login/service/firebase_firestore_service.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  List<dynamic> users = [];

  @override
  Widget build(BuildContext dashboardContext) {
    final CounterController counterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await showDialog(
                  context: dashboardContext,
                  builder: (BuildContext dialogContext) {
                    return AlertDialog(
                      icon: Icon(Icons.warning),
                      title: Text('Signout !'),
                      content: Text('Are you sure ?'),
                      actions: [
                        GestureDetector(
                          child: Text('Yes'),
                          onTap: () {
                            final firebaseAuthService = FirebaseAuthService();
                            firebaseAuthService.signOutUser();
                            Navigator.of(dialogContext).pop();
                            Navigator.of(dashboardContext)
                                .pushReplacementNamed('/login');
                          },
                        ),
                        GestureDetector(
                          child: Text('No'),
                          onTap: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    );
                  });
            },
            child: Text('Signout'),
          )
        ],
      ),
      body: Column(
        children: [
          Obx(
             () {
              return Text("the counter value is ${counterController.counter}");
            }
          ),
          SizedBox(height: 10,),
          IconButton(icon:Icon(Icons.add),onPressed: (){
            counterController.increment();
          },),
          SizedBox(height: 10,),
          IconButton(icon:Icon(Icons.remove),onPressed: (){
            counterController.decrement();
          },),
          FutureBuilder(
              future: FirebaseFirestoreService().getAllUsersInACollection(),
              builder: (context, snapShot) {
                if (snapShot.hasError) {
                  return Center(
                    child: Icon(Icons.warning),
                  );
                }
                if (snapShot.connectionState == ConnectionState.done) {
                  if (snapShot.data != null) {
                    users = snapShot.data as List;
                    return Center(
                      child: Text("the user is ${users[0]}"),
                    );
                  } else {
                    return Center(
                      child: Icon(Icons.warning),
                    );
                  }
                }
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                );
              }),
        ],
      ),
    );
  }
}
