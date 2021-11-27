
 import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_art/model/product.dart';
import 'package:world_of_art/provider/cartItem.dart';
import 'package:world_of_art/provider/google_signin.dart';
import 'package:world_of_art/services/productservice.dart';

//
  class CartService extends ChangeNotifier {

    final List<CartItem> _items = [];

    UnmodifiableListView<CartItem> get items => UnmodifiableListView(_items);

    void add(BuildContext context, CartItem item) {

     _items.add(item);

      GoogleSignInProvider googleSignInProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
      Map<String, int> cartMap = Map();
      _items.forEach((CartItem item) {
        cartMap[item.products.first.pLocation]  = (item.products ) as int;
     });

      FirebaseFirestore  _instance = FirebaseFirestore.instance;
     _instance.collection('products')
         .doc(googleSignInProvider.googleSignIn.clientId)
         .set({
       'cartItems': cartMap
     }).then((value) {
       notifyListeners();
     });
   }

  void removeAll(BuildContext context) {

    GoogleSignInProvider googleSignInProvider = Provider.of<GoogleSignInProvider>(context, listen: false);
    FirebaseFirestore  _instance = FirebaseFirestore.instance;
    _instance.collection('products')
        .doc(googleSignInProvider.googleSignIn.clientId)
        .update({
      'cartItems': FieldValue.delete()
    }).then((value) {
      _items.forEach((CartItem item) { (item.products as Products); });
      _items.clear();
      notifyListeners();
    });
  }

  Products getProductFromCart(Products product) {
  //  bool products = false;
    Products  products = product;
    if (_items.length > 0 && _items.any((CartItem item) => item.products.first.pName   == product.pName)) {
      CartItem cartItem = _items.firstWhere((CartItem item) => item.products.first.pName == product.pName);

      if (cartItem != null) {
        products = cartItem.products as Products ;
      }
   }

    return products;

  }
//
   void loadCartItemsFromFirebase(BuildContext context) {
//
//     // clear the items up front
     if (_items.length > 0) {
       _items.clear();
     }
//
     GoogleSignInProvider googleSignInProvider = Provider.of<
         GoogleSignInProvider>(context, listen: false);
     CategoryService catService = Provider.of<CategoryService>(
         context, listen: false);
    // CategorySelectionService categorySelectionService = Provider.of<
      //   CategorySelectionService>(context, listen: false);
//
     if (googleSignInProvider.isSigningIn) {
       FirebaseFirestore    _instance = FirebaseFirestore.instance;
       _instance.collection('shoppers')
           .doc(googleSignInProvider.googleSignIn.clientId)
           .get().then((DocumentSnapshot snapshot) {
//
         if (snapshot.exists) {
           Map<String, dynamic> cartItems = snapshot.get(
               FieldPath(['cartItems']));
//
           catService.getProducts().forEach((Products cat) {
             cat.subCategories.forEach((Products subCat) {
               if (cartItems.keys.contains(subCat.pLocation)) {

                 _items.add(CartItem(


                 ));

               }
             });
           });
//
           notifyListeners();
         }
       });
     }
   }
  }

