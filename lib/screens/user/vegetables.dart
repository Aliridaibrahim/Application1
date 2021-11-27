import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:world_of_art/Widgets/functions.dart';
import 'package:world_of_art/Widgets/productview.dart';
import 'package:world_of_art/model/product.dart';
import 'package:world_of_art/provider/cartItem.dart';
import 'package:world_of_art/screens/user/productioninfo.dart';
import 'package:world_of_art/services/productservice.dart';
import 'package:world_of_art/services/store.dart';

import '../../constants.dart';

class Vegetables extends StatefulWidget {


  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  @override
  Widget build(BuildContext context) {

    final _categoryService = CategoryService();
    List<Products> products;
    int _tabBarIndex = 0;
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
                    'Vegtable',
                    style: TextStyle(
                      color: _tabBarIndex == 0 ? Colors.black : Color(
                          0xFFC1BDB8),
                      fontSize: _tabBarIndex == 0 ? 16 : null,
                    ),
                  ),
                  Text(
                    'Gaz',
                    style: TextStyle(
                      color: _tabBarIndex == 1 ? Colors.blue : Color(
                          0xFFC1BDB8),
                      fontSize: _tabBarIndex == 1 ? 16 : null,
                    ),
                  ),
                  Text(
                    'Detergents',
                    style: TextStyle(
                      color: _tabBarIndex == 2 ? Colors.green : Color(
                          0xFFC1BDB8),
                      fontSize: _tabBarIndex == 2 ? 16 : null,
                    ),
                  ),
                  Text(
                    'ca.food',
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
                ProductsView(kvegtebales, products),
                ProductsView(kGaz, products),
                ProductsView(kDetergents, products),
                ProductsView(kcafood, products),
              ],
            ),
          )
          )
        ]
    );
  }
  Widget jacketView()  {
    final _store = Store();
    List<Products> products;
    final _categoryService = CategoryService();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    // initialData: _categoryService.getProductsCollectionFromFirebase(),
      stream: _store.loadProducts(),
      builder: (context, snapshot) {
    if (snapshot.hasData) {
      List<Products> products = [];
      for (var doc in snapshot.data.docs) {
        var data = doc.data;
        // var maps = doc.data;
        products.add(Products(
          pId: doc.id,
          pName: data()['kProductName'],
          pLocation: doc.data()['kProductLocation'],
          pDescription: doc.data()['kProductDescription'],
          pCategory: doc.data()['kProductCategory'],
          pPrice: data()[kProductPrice],

        )
        );
        print(products);
        print("DFDuccess");
      }
    }

          products = [...products];
          products.clear();
          print('data is her');
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


      },
    );
  }
}
