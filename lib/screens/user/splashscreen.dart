import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/screens/user/Homepage.dart';
import 'package:world_of_art/screens/user/login.dart';

String finalEmail;
class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 1),()=>
      (finalEmail == null ? Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return LoginPage();
          })) :Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (BuildContext context) {
      return HomePage();
      })
      )
        )
      );

    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences
        .getInstance();
    var obtaineEmail = sharedPreferences.getString("email");
    setState(() {
      finalEmail = obtaineEmail;
    });
    print(finalEmail);
  }


  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: (
            Center(
              child: CircularProgressIndicator(backgroundColor: Colors.black,),
            )
        )
    );
  }
}


  // void initState() {
  //   getValidationData().whenComplete(() async{
  //     Timer(Duration(seconds: 3),()=> (finalEmail==null ? LoginPage() : HomePage()));
  //   });
  //   startTime();
  //   super.initState();
  // }
  //
  // startTime() async {
  //
  //   var duration = new Duration(seconds: 3);
  //   return new Timer(duration, navigatonpage);
  // }
  //
  // Future<void> navigatonpage() {
  //
  //     Navigator.of(context).pushReplacementNamed("splachscreen");
  //   }


  //





//
// getValidationData().whenComplete(() async {
// if (finalEmail == null) {
// return LoginPage();
// }else{
// return HomePage();
// }
// } );
