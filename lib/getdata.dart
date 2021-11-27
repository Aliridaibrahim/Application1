
//
//
//
// import 'dart:async';
//
//
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:world_of_art/model/product.dart';
//
//
// class DBStore {
//  // DBStore._();
//
//   static Database _sqDatabase;
//  // static final db = DBStore._();
//
//   Future<Database> get database async {
//     // If database exists, return database
//     if (_sqDatabase != null) {
//       return _sqDatabase;
//     }
//
//     // If database don't exists, create one
//     _sqDatabase = await initNewDB();
//
//     return _sqDatabase;
//   }
//
//   Future initNewDB() async {
//
//
//     var documentsDirectory;
//     final path = join(documentsDirectory.path, 'productst_sqlite.db');
//
//     return await openDatabase(path, version: 1, onOpen: (db) {},
//         onCreate: (Database db, int version) async {
//           // Table for App Labels
//           await db.execute(
//             'CREATE TABLE Products(id INTEGER PRIMARY KEY,author TEXT,quote TEXT, quoteId TEXT)',
//           );
//           await db.execute(
//             'CREATE TABLE Product(id INTEGER PRIMARY KEY,name TEXT,lastUpdated TEXT)',
//           );
//         });
//   }
//
//   Future updateProduct(Products product) async {
//     final db = await database;
//     final queryResult = await db.insert('ApiCacheLog', PathMap());
//
//     return queryResult;
//   }
//
//   // Get Cache Log
//   Future getProducts() async {
//     final db = await database;
//     final logs = await db.query('ApiCacheLog');
//
//     return logs.isNotEmpty
//         ? List.generate(
//       logs.length,
//           (i) => Products(
//             pId: logs[i]['id'],
//             pName: logs[i]['kProductName'],
//             pLocation:logs[i]['kProductLocation'],
//             pDescription: logs[i]['kProductDescription'],
//             pCategory: logs[i]['kProductCategory'],
//       ),
//     )
//         : [];
//   }
//
//   Future addProduct(List Product) async {
//     final db = await database;
//     final batch = db.batch();
//
//     await clearTable('Quotes');
//
//     for (int i = 0; i < Product.length; i++) {
//       batch.insert('Quotes', Product[i].toMap());
//     }
//
//     await batch.commit();
//     // await updateProduct(CacheLog(
//     //   Random().nextInt(100),
//     //   'Quotes',
//     //   (DateTime.now().toUtc()).toString(),
//     // ));
//   }
//
// // Get All app labels
//   Future gettProducts() async {
//     final db = await database;
//     final labels = await db.query('Products');
//
//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return labels.isNotEmpty
//         ? List.generate(
//       labels.length,
//           (i) => Products(
//             pId: labels[i]['id'],
//             pName: labels[i]['kProductName'],
//             pLocation:labels[i]['kProductLocation'],
//             pDescription: labels[i]['kProductDescription'],
//             pCategory: labels[i]['kProductCategory'],
//       ),
//     )
//         : [];
//   }
//
//   // Delete all rows
//   Future clearTable(String tableName) async {
//     final db = await database;
//     final queryResult = await db.rawDelete('DELETE FROM $tableName');
//
//     return queryResult;
//   }
// }