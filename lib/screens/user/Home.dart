


import 'package:flutter/material.dart';
import 'package:world_of_art/screens/user/Clothes.dart';
import 'package:world_of_art/screens/user/Homepage.dart';
import 'package:world_of_art/screens/user/profile.dart';
import 'package:world_of_art/screens/user/vegetables.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(





      body:

      Container(
          padding: EdgeInsets.only(top:85,left: 10,right: 15,bottom: 10,),
          width: double.infinity,
         // color: Colors.white,
          color: Colors.blue,
          child: ListView(
        children: <Widget>[
          //SizedBox(width: 10,height: 1,),
         Card(child:ListTile(title: Text("Vegtebles"),leading: Icon(Icons.shopping_basket_sharp),trailing:  IconButton(onPressed: (){
           Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Vegetables()));
         },
           icon: Icon(Icons.expand_less,color: Colors.grey,), ),) ,),
        //  Divider(
          //  color: Colors.grey,
         //   thickness: 1,
        //  ),
          Card(child:ListTile(title: Text("Clothes"),leading: Icon(Icons.category),trailing:  IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Clothes()));
          },
            icon: Icon(Icons.expand_less,color: Colors.grey,), ),) ,),
        //  Divider(
          //  color: Colors.grey,
        //    thickness: 1,
        //  ),
            Card(child:ListTile(title: Text("Books"),leading: Icon(Icons.book), trailing:  IconButton(onPressed: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Profile()));
    },
    icon: Icon(Icons.expand_less,color: Colors.grey,), ),) ,),


        //  Divider(
          //  color: Colors.grey,
            //thickness: 1,
          //),
          Card(child:ListTile(title: Text("Cars"),leading: Icon(Icons.car_rental_rounded),trailing:  IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vegetables()));
          },
            icon: Icon(Icons.expand_less,color: Colors.grey,), )) ,),
       //   Divider(
         //   color: Colors.grey,
           // thickness: 1,
          //),
          Card(child:ListTile(title: Text("Gaz"),leading: Icon(Icons.backpack),trailing:  IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Vegetables()));
          },
            icon: Icon(Icons.expand_less,color: Colors.grey,), )) ,),
         // Divider(
           // color: Colors.grey,
            //thickness: 1,
        //  ),
        ],
        shrinkWrap: true,
        reverse: false,
        padding: EdgeInsets.all(2),
      )

      ),



    );
  }
}
