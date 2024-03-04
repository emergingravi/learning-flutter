import 'dart:async';

import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 4),() => Navigator.of(context).pushReplacementNamed('/profile'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 400,),
              Image.asset("assets/images/bubble.gif" , height:100,width:100,),
              Text("Apify" , style: TextStyle(fontSize:23,fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ),
    );
  }
}
