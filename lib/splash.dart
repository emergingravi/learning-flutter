import 'dart:async';

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(Duration(seconds: 2),() => Navigator.of(context).pushNamed('/listpageview'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/bubble.gif" , height:200,width: 200,),
      ),
    );
  }
}
