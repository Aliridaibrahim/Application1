

import 'package:world_of_art/model/product.dart';

List<Products> getProductByCategory(String kJackets, List<Products> allproducts) {
  List<Products> products = [];
  try {
    for (var product in allproducts) {
      if (product.pCategory == kJackets) {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}