import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_art/Widgets/functions.dart';
import 'package:world_of_art/Widgets/productview.dart';
import 'package:world_of_art/model/product.dart';
import 'package:world_of_art/model/product.dart';
import 'package:world_of_art/screens/user/productioninfo.dart';
import 'package:world_of_art/services/productservice.dart';
import 'package:world_of_art/services/store.dart';

import '../../constants.dart';


class Clothes extends StatefulWidget {
  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {

  @override
  final _store = Store();

  List<Products> products;

  int _tabBarIndex = 0;
  Widget build(BuildContext context) {
    CategoryService catService = Provider.of<CategoryService>(context, listen: false);
    List<Products> products = catService.getProducts();
  //  List<Products> products = Provider.of<CartItem>(context).products;
    return Stack(
        children: [
        DefaultTabController(length: 4, child: Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
        indicatorColor: Color(0xFFFFC12F),
    onTap: (value) {
    setState(() {
    _tabBarIndex = value;
    });
    },
    tabs: <Widget>[
    Text(
    'Jackets',
    style: TextStyle(
    color: _tabBarIndex == 0 ? Colors.black : Color(
    0xFFC1BDB8),
    fontSize: _tabBarIndex == 0 ? 16 : null,
    ),
    ),
    Text(
    'Trouser',
    style: TextStyle(
    color: _tabBarIndex == 1 ? Colors.blue : Color(
    0xFFC1BDB8),
    fontSize: _tabBarIndex == 1 ? 16 : null,
    ),
    ),
    Text(
    'T-shirts',
    style: TextStyle(
    color: _tabBarIndex == 2 ? Colors.green : Color(
    0xFFC1BDB8),
    fontSize: _tabBarIndex == 2 ? 16 : null,
    ),
    ),
    Text(
    'Shoes',
    style: TextStyle(
    color: _tabBarIndex == 3 ? Colors.red : Color(0xFFC1BDB8),
    fontSize: _tabBarIndex == 3 ? 16 : null,
    ),
    ),
    ],
    ),
    ),
          body:
          TabBarView(
               children: <Widget>[
                jacketView(),
                 ProductsView(kTrousers, products),
               Shoes(),
             //  ProductsView(kShoes, products),
                ProductsView(kTshirts, products),
               ],
             ),
    )
    )
        ]
    );

  }
  Widget jacketView()  {


    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _store.loadProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Products> products = [];
          for (var doc in snapshot.data.docs) {
            var data = doc.data;
           // var maps = doc.data;
            products.add(Products(
                pId: doc.id,
              pName: doc.data()['ProductName'],
              pLocation:doc.data()['kProductLocation'],
              pDescription: doc.data()['kProductDescription'],
              pCategory: doc.data()['kProductCategory'],
              pPrice: data()[kProductPrice],


            )
            );print(products);
            print("DFDuccess");}
          products = [...products];
        //  products.clear();
          products = getProductByCategory(kJackets, products);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
            ),
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProductInfo.id,
                          arguments: products[index]);
                    },
                    child: Stack(
                      children: <Widget>[

                       Positioned.fill(
                         child: Image(
                           fit: BoxFit.fill,
                           image: AssetImage(products[index].pLocation),
                           //  image: AssetImage(products[index].pLocation),
                         ),
                       ),

                        Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .6,
                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              height: 60,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      products[index].pName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$ ${products[index].pPrice}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            itemCount: products.length,

          );
        } else {
          return Scaffold( body:Center(
              child: Stack(
                children: <Widget>[
              Positioned.fill(
              child:Text("test2") ,
              //Image(
               // fit: BoxFit.fill,
                //  image: AssetImage('images/jacket1.jpg'),
             // )
          )
            ]

          )

          ),


          );

        }

      },
    );
  }
Widget Shoes(){
  CategoryService catService = Provider.of<CategoryService>(context, listen: false);
  List<Products> products = catService.getProducts();

   return Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Padding(
           padding: const EdgeInsets.only(top: 10, bottom: 10),
           child: Text('Shoes:',
               textAlign: TextAlign.center,
               style: TextStyle(color: Colors.black)
           ),
         ),
         Expanded(
           child: ListView.builder(
             itemCount: products.length,
             itemBuilder: (BuildContext ctx, int index) {
               return  Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text(
                     products[index].pName,
                     style: TextStyle(
                         fontWeight: FontWeight.bold),
                   ),
                   Text('\$ ${products[index].pPrice}')
                 ],
               );
             },
           ),
         )
       ]
   );

}
  // Widget Shoes() {
  //   return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  //     stream: _store.loadProducts(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List<Products> products = [];
  //         for (var doc in snapshot.data.docs) {
  //           var data = doc.data;
  //           products.add(Products(
  //
  //               pPrice: data()['pName'],
  //               pName: data()['kProductName'],
  //               pDescription: data()['kProductDescription'],
  //               pLocation: data()['kProductLocation'],
  //               pCategory: data()['kProductCategory']
  //           )
  //
  //           );
  //           print("lololololo");
  //          }
  //
  //         products = [...products];
  //        // products.clear();
  //         products = getProductByCategory(kJackets, products);
  //         return GridView.builder(
  //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             childAspectRatio: .8,
  //           ),
  //           itemBuilder: (context, index) =>
  //               Padding(
  //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     Navigator.pushNamed(context, ProductInfo.id,
  //                         arguments: products[index]);
  //                   },
  //                   child: Stack(
  //                     children: <Widget>[
  //                      // Positioned.fill(
  //                        // child: Image(
  //                         //  fit: BoxFit.fill,
  //                         //  image: AssetImage(products[index].pLocation),
  //                       //  ),
  //                     //  ),
  //                       Positioned(
  //                         bottom: 0,
  //                         child: Opacity(
  //                           opacity: .6,
  //                           child: Container(
  //                             width: MediaQuery
  //                                 .of(context)
  //                                 .size
  //                                 .width,
  //                             height: 60,
  //                             color: Colors.white,
  //                             child: Padding(
  //                               padding: EdgeInsets.symmetric(
  //                                   horizontal: 10, vertical: 5),
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: <Widget>[
  //                                   Text(
  //                                     products[index].pName,
  //                                     style: TextStyle(
  //                                         fontWeight: FontWeight.bold),
  //                                   ),
  //                              //     Text('\$ ${products[index].pPrice}')
  //                                 ],
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //           itemCount: products.length,
  //
  //         );
  //       } else {
  //
  //         return Scaffold( body:  Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  //
  //         child:  Stack(
  //           children: <Widget>[
  //             Positioned.fill(
  //               child: Image(image: AssetImage('images/jacket1.jpg'),)
  //             ),
  //           //Image(
  //                // fit: BoxFit.fill,
  //                // image: AssetImage(products[index].pLocation),
  //              // ),
  //           //  ),
  //
  //           ],
  //         ),)
  //         );
  //       //  Image(image: AssetImage('images/jacket1.jpg'),)
  //         // return Scaffold(
  //         //     body: Center(child: Text
  //         //       ("LOading"),
  //         //
  //         //     )
  //         //
  //         //
  //         //
  //         // );
  //
  //       }
  //
  //     },
  //   );
  // }
}


