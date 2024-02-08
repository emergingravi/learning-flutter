import 'package:flutter/material.dart';
import 'package:login/list_view_page.dart';
import 'package:login/listpage.dart';
import 'package:login/login.dart';
import 'package:login/register.dart';
import 'package:login/splash.dart';

void main() {
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
      '/':( context) => Splash(),
      '/register':(context) =>Register(),
      '/login':(context) => Login(),
      '/listpage':(context) =>ListPage(),
      '/listpageview':(context) =>ListPageView(),
    },
    initialRoute: '/Splash' ,
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSIT3rd'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:()=> Navigator.of(context).pushNamed('/login') ,
              child: Text('Login'),
            ),
            SizedBox(width: 30,),
            ElevatedButton(
              onPressed: ()=> Navigator.of(context).pushNamed('/register'),
              child: Text('Register'),
            ),
            SizedBox(width: 30,),
            ElevatedButton(
              onPressed: ()=> Navigator.of(context).pushNamed('/listpage'),
              child: Text('List page'),
            ),
          ],
        ),
      ),
    );
  }
}