import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_of_art/ViewModel/BooksList.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
    Provider.of<BooksList>(context,listen: false).fetchTopBooks();
  }
  Widget build(BuildContext context) {
    final u = Provider.of<BooksList>(context);
    return Scaffold(
      body: _buildUI(u),
    );
  }
  Widget _buildUI(BooksList u){
    if(u.books == null) {
      return Align(child: CircularProgressIndicator());
    } else if(u.books.isEmpty) {
      return Align(child: Text("Cannot fetch Books."));
    } else {
      return _bookslist(context);
    }
  }
  Widget _bookslist(BuildContext context){

    final u = Provider.of<BooksList>(context);
    return ListView.builder(
        itemCount: u.books.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network(u.books[index].image),
            title:
              Text(u.books[index].title ),

             //subtitle: Text(u.books[index].price),
            subtitle: Text(u.books[index].subtitle),
          );
        });

  }
}

