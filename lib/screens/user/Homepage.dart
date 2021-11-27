
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:world_of_art/ViewModel/BooksList.dart';
import 'package:world_of_art/model/product.dart';
import 'package:world_of_art/provider/user.dart';
import 'package:world_of_art/screens/user/CartScreen.dart';
import 'package:world_of_art/screens/user/Clothes.dart';
import 'package:world_of_art/screens/user/Home.dart';
import 'package:world_of_art/screens/user/login.dart';
import 'package:world_of_art/screens/user/profile.dart';
import 'package:world_of_art/screens/user/settings.dart';
import 'package:world_of_art/screens/user/vegetables.dart';
import 'package:world_of_art/search.dart';
import 'package:world_of_art/services/store.dart';






class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthBase authBase = AuthBase();
  int selectedIndex = 0;



  final screens = [
    Home(),
   // Center(child: Text('Home', style: TextStyle(fontSize: 60),),),
    // HomePage(),
    Profile(),
    Setttings(),
    Vegetables(),
   // Center(child: Text('PROFILE', style: TextStyle(fontSize: 60),),),
    Clothes(),

    // Profile(),

  ];

// final user = FirebaseAuth.instance.currentUser;
  void initState() {
    super.initState();
    Provider.of<BooksList>(context, listen: false).fetchTopBooks();
  }


  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(length: 4, child: Scaffold(

          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Color(0xFFC1BDB8),
            currentIndex: selectedIndex,
            fixedColor: Color(0xFFFFC12F),
            onTap: (value) async {
              if (value == 5) {
                SharedPreferences pref =
                await SharedPreferences.getInstance();
                pref.clear();
                await authBase.logout();
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              }
              setState(() {
                selectedIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  title: Text('Home'), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Text('BOOKS'), icon: Icon(Icons.book)),
              BottomNavigationBarItem(
                  title: Text('Setting'), icon: Icon(Icons.settings)),
              BottomNavigationBarItem(
                  title: Text('Market'), icon: Icon(Icons.shopping_basket)),
              BottomNavigationBarItem(
                  title: Text('Clothes'), icon: Icon(Icons.category)),
              BottomNavigationBarItem(
                  title: Text('Sign Out'), icon: Icon(Icons.close)),

            ],
          ),
          body:Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(   child: screens[selectedIndex],
            ),

          )






        ),
        ),
        Material(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * .1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    height: 100,
                    width: 300,
                    child: Search(),
                  ),
                  // Text(
                  //   'HELLO'.toUpperCase(),
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Cartscreen()));
                      },
                      child: Icon(
                        Icons.shopping_cart, color: Color(0xFFFFC12F),))
                ],
              ),
            ),
          ),
        )

      ],
    );
  }

}








