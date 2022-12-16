import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/global_states/books_state.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class BookDetailsScreen extends StatelessWidget {
  final int bookId;
  const BookDetailsScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Consumer<Books>(
      builder: (context, books, child) {
        Book book = books.books[bookId];
        return Scaffold(
          appBar: AppBar(
            title: Text(book.title),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 4.0, top: 30.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Text(
                        book.content,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'by ${book.author}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
