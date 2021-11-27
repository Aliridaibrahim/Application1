import 'dart:ui';
import 'dart:convert';

import 'package:flutter/material.dart';


class Products {
  String pLocation;
  String pName;
  String pPrice;
  String pDescription;
  String pCategory;
  String pId;
  int pQuantity;
  List<Products> subCategories;
  Products(
      {this.pQuantity,
        this.pId,
        this.pName,
        this.pCategory,
        this.pDescription,
        this.pLocation,
        this.subCategories,
        this.pPrice});
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     '_Location' : pLocation,
  //     '_id': pId,
  //     '_name': pName,
  //     '_category': pCategory,
  //     '_quantity': pQuantity,
  //     '_price': pPrice,
  //     '_description': pDescription,
  //   };
  // }
  factory Products.fromJson(Map<String,dynamic> json){
    return Products(
    pLocation: json['pLocation'],
    pId: json['pId'],
    pName: json['pName'],
    pCategory: json['pCategory'],
    pQuantity: json['pQuantity'],
    pPrice: json['pPrice'],
    pDescription: json['pDescription'],
    );
}


  static List<Products> fromJsonArray(List<dynamic> jsonArray) {
    List<Products> subCategoriesFromJson = [];

    jsonArray.forEach((jsonData) {
      subCategoriesFromJson.add(Products.fromJson(jsonData));
    });

    return subCategoriesFromJson;
  }

}





// class ProductModel{
//
//   String _pLocation;
//   String _id;
//   String _name;
//   String _picture;
//   String _description;
//   String _category;
//   int _quantity;
//   int _price;
//   bool _featured;
//
//
//
//   ProductModel.fromMap(Map<String, dynamic> data()) {
//     _pLocation = data()['_pLocation'];
//     _id = data()['_id'];
//     _name = data()['_name'];
//     _picture = data()['_picture'];
//     _category = data()['_category'];
//     _quantity = data()['_quantity'];
//     _price = data()['_price'];
//     _featured = data()['_featured'];
//     _description = data()['_description'];
//
//
//
//
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       '_Location' : _pLocation,
//       '_id': _id,
//       '_name': _name,
//       '_picture': _picture,
//       '_category': _category,
//       '_quantity': _quantity,
//       '_price': _price,
//       '_featured': _featured,
//       '_description': _description,
//     };
//   }
//
// }
//

