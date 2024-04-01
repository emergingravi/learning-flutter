
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/dashboard.dart';
import 'package:login/edit_profile.dart';
import 'package:login/list_view_page.dart';
import 'package:login/listpage.dart';
import 'package:login/login.dart';
import 'package:login/profil.dart';
import 'package:login/register.dart';
import 'package:login/splash.dart';
import 'package:login/users_list.dart';
import 'package:login/utils/default_firebase_config.dart';

import 'controller/counter_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initialfirebase();
  runApp(MaterialApp(
    title: 'Flutter App!!',
    theme: ThemeData(
      colorSchemeSeed: Colors.indigo,
      useMaterial3: false,
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      colorSchemeSeed: Colors.blue,
      useMaterial3: true,
      brightness: Brightness.dark,
    ),
    routes: {
      '/': (context) => Splash(),
      '/register': (context) => Register(),
      '/login': (context) => Login(),
      '/listpage': (context) => ListPage(),
      '/listpageview': (context) => ListPageView(),
      '/myapp': (context) => MyApp(),
      '/dashboard' :(context) => Dashboard(),
      '/profile' :(context) => Profile(),
      '/userslist' :(context) => UsersList(),
      '/edit_profile' :(context) => EditProfile(),
    },
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
  ));
}

void initialfirebase() async{
  await Firebase.initializeApp(options:DefaultFirebaseOptions.web);
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

 final pages =[
   Login(),
   ListPage(),
   ListPageView(),
 ];

  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){setState(() {
          _currentIndex=index;
        });},
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'login'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.next_plan), label: 'next'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.mobile_friendly_sharp), label: 'settings'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.settings), label: 'settings'),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
