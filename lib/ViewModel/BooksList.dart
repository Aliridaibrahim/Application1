



import 'package:flutter/cupertino.dart';
import 'package:world_of_art/model/BooksModel.dart';
import 'package:world_of_art/services/Webservices.dart';

class BooksList with ChangeNotifier{
  List<BooksViewModel> books;

  Future<void>fetchTopBooks() async{

    final books = await Webservice().fetchBooks();
    this.books = books.map((book) => BooksViewModel(book)).toList();
    notifyListeners();
  }
}
class BooksViewModel{

  final Book book;

  BooksViewModel(this.book);
  String get title{
    return this.book.title;
  }
  String get subtitle{
    return this.book.subtitle;
  }
  String get isbn13{
    return this.book.isbn13;
  }
  String get price{
    return this.price;
  }
  String get image{
    return this.book.image;
  }
  String get url{
    return this.book.url;
  }
}