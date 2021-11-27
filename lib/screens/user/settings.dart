
import 'package:flutter/material.dart';

import 'package:world_of_art/screens/user/Homepage.dart';


class Setttings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(child: ListView(
    children: [
      ListTile(title: Text("My profile"),leading: Icon(Icons.account_circle_outlined),),
      Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      ListTile(title: Text("Language"),leading: Icon(Icons.circle),),
      Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      ListTile(title: Text("My Wishlist"),leading: Icon(Icons.favorite),
      trailing:  IconButton(onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()));
      },
        icon: Icon(Icons.expand_less,color: Colors.grey,), ),),

      Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      ListTile(title: Text("About Us"),leading: Icon(Icons.block),),
      Divider(
        color: Colors.grey,
        thickness: 1,
      ),
      ListTile(title: Text("Sign Out"),leading: Icon(Icons.person_remove),),
      Divider(
        color: Colors.grey,
        thickness: 1,
      ),
    ],
  )

),

    );

  }

}
//Container(height: 50,child:Center(child: Text('SETTINGS',style: TextStyle(color: Color(0xFFE65100),fontSize: 30),))

//),

//
// Column(
// children: [
// Container(
// height: 50,child:Center(child: Text('SETTINGS',style: TextStyle(color: Color(0xFFE65100),fontSize: 30),))
// ),Divider(color: Colors.black,
// thickness: 1,),
// Container(height: 20 ,width: 400, child: Text('My profile'),),
//
// Divider(color: Colors.black,
// thickness: 1,),
// Container(
// height: 20 ,width: 400, child: Text('Language'),
// ),
//
//
// Divider(color: Colors.black,
// thickness: 1,),
// Container(
// height: 20 ,width: 400, child: Text('My wishlist'),
// ),Divider(color: Colors.black,
// thickness: 1,),
// Container(
// height: 20 ,width: 400, child: Text('About Us'),
//
// ),Divider(color: Colors.black,
// thickness: 1,),
// Container(
// height: 20 ,width: 400, child: Text('Sign Out') ,
//
// ),
// Divider(color: Colors.black,
// thickness: 1,),
//
// ],
// ),