
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:world_of_art/model/product.dart';

import '../constants.dart';

class Store  {


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>>  addProduct(Products products) {
    _firestore.collection(kProductsCollection).add({
      kProductName: products.pName,
      kProductDescription: products.pDescription,
      kProductLocation: products.pLocation,
      kProductCategory: products.pCategory,
      kProductPrice: products.pPrice
    });
    print(products);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> loadProducts() {
    return _firestore.collection(kProductsCollection).snapshots();

  }

  Stream<QuerySnapshot<Map<String, dynamic>>> loadOrders() {
    return _firestore.collection(kOrders).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> loadOrderDetails(documentId) {
    return _firestore
        .collection(kOrders)
        .doc(documentId)
        .collection(kOrderDetails)
        .snapshots();
  }
  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore
        .collection(kProductsCollection)
        .doc(documentId)
        .update(data);
  }

  storeOrders(data, List<Products> products) {
    var documentRef = _firestore.collection(kOrders).doc();
    documentRef.set(data);
    for (var product in products) {
      documentRef.collection(kOrderDetails).doc().set({
        kProductName: product.pName,
        kProductPrice: product.pPrice,
        kProductQuantity: product.pQuantity,
        kProductLocation: product.pLocation,
        kProductCategory: product.pCategory
      });
    }
  }
}




