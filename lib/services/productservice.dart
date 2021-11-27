





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:world_of_art/model/product.dart';

class CategoryService extends ChangeNotifier{


  List<Products> _products = [];

  List<Products> getProducts() {
    return _products;
  }

  Future<dynamic> getProductsCollectionFromFirebase() async {
    FirebaseFirestore  _instance = FirebaseFirestore.instance;
    CollectionReference products = _instance.collection('products');

    DocumentSnapshot snapshot = await products.doc('products').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var productsData = data['products'] as List<dynamic>;
      productsData.forEach((catData) {
        Products cat = Products.fromJson(catData);
        _products.add(cat);
      });
    }
  }


}