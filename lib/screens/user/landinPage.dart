import 'package:flutter/material.dart';
import 'package:world_of_art/screens/user/signup.dart';

import 'login.dart';
class LandinPage extends StatefulWidget {
  @override
  _LandinPageState createState() => _LandinPageState();
}

class _LandinPageState extends State<LandinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,

          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'For A Life Full of Creativity',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 37,

                  ),
                ),
                SizedBox(
                 // height: 20,
                ),Container( height: 60,
                  width: 300,
                  margin: const EdgeInsets.only(top: 150),
                  child: ElevatedButton(
                    child: Text("Login",style: TextStyle(color: Colors.red),),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return LoginPage();
                        },
                      ));

                    },
                    style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5)),

                  ),
         ),
                // ), SizedBox(
                //   height: 140,
                // ),
           Container( height: 60,
                  width: 300,
                  margin: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    child: Text("Sign Up",style: TextStyle(color: Colors.red),),

                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context) {
                          return SignUp();
                        },
                      ));

                    },
                    style: ElevatedButton.styleFrom(primary:Color(0xFFFAFAFA),onSurface: Color(0xFF039BE5)),

                  ),

                ),
              ]
          ),
        ),


    );
  }
}
