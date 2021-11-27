
import 'package:flutter/cupertino.dart';
import 'package:world_of_art/model/product.dart';


class CartItem extends ChangeNotifier {
  List<Products> products = [];


  addProduct(Products product) {
    products.add(product);
    notifyListeners();
  }

  deleteProduct(Products product) {
    products.remove(product);
    notifyListeners();
  }
}










//
// class ProductProvider with ChangeNotifier{
//   ProductServices _productServices = ProductServices();
//   List<ProductModel> products = [];
//   List<ProductModel> productsSearched = [];
//
//
//   ProductProvider.initialize(){
//     loadProducts();
//   }
//
//   loadProducts()async{
//     products = await _productServices.getProducts();
//     notifyListeners();
//   }
//
//   Future search({String productName})async{
//     productsSearched = await _productServices.searchProducts(productName: productName);
//     notifyListeners();
//   }
//
// }