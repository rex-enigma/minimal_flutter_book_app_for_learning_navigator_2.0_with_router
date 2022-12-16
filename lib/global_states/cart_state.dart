import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/models/book.dart';

class Cart extends ChangeNotifier {
  List<Book> books = [];
  List<int> addedBooks = [];

  void addBook(Book book) {
    books.add(book);
    notifyListeners();
  }

  void removeAll() {
    books.clear();
  }
}
