import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_art/provider/adminMode.dart';
import 'package:world_of_art/provider/cartItem.dart';
import 'package:world_of_art/screens/admin/OrdersScreen.dart';
import 'package:world_of_art/screens/admin/addProduct.dart';
import 'package:world_of_art/screens/admin/adminHome.dart';
import 'package:world_of_art/screens/admin/editProduct.dart';
import 'package:world_of_art/screens/admin/manageProduct.dart';
import 'package:world_of_art/screens/admin/order_details.dart';
import 'package:world_of_art/screens/user/Homepage.dart';
import 'package:world_of_art/screens/user/landinPage.dart';
import 'package:world_of_art/screens/user/productioninfo.dart';

import 'package:world_of_art/screens/user/splashscreen.dart';
import 'package:world_of_art/services/Cartservice.dart';
//import 'package:world_of_art/services/productservice.dart';

import 'ViewModel/BooksList.dart';

import 'provider/google_signin.dart';
import 'provider/modelHud.dart';
import 'services/productservice.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GoogleSignInProvider>(create: (context)=> GoogleSignInProvider(),
    //    MaterialApp
    child: MultiProvider(
      providers: [
    ChangeNotifierProvider<ModelHud>(
    create: (context) => ModelHud())
        ,
    ChangeNotifierProvider<CartItem>(
    create: (context) => CartItem(),

    ), ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
        ChangeNotifierProvider(
            create: (context) =>  BooksList()
        ),
        ChangeNotifierProvider(
            create: (context) => CartService()
        ),
        ChangeNotifierProvider(
            create: (context) => CategoryService()
        )



      ],child: MaterialApp(


        debugShowCheckedModeBanner: false,
      // home: NavigationBarPage(),

        home: Splashscreen(),



        routes:<String,WidgetBuilder> {

          'splachscreen': (buildContext)=>LandinPage() ,
          'homepage' : (buildContext)=>HomePage() ,
          'login': (buildContext)=>LandinPage() ,
          ProductInfo.id: (context) => ProductInfo(),
          OrderDetails.id: (context) => OrderDetails(),
          OrdersScreen.id: (context) => OrdersScreen(),
          EditProduct.id: (context) => EditProduct(),
          ManageProducts.id: (context) => ManageProducts(),
          AdminHome.id: (context) => AdminHome(),
          AddProduct.id: (context) => AddProduct(),


        }

    )
    ),
    );

  }

}

