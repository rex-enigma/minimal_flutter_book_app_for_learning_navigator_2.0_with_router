import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/models/screen_paths.dart';
import 'package:provider/provider.dart';
import 'package:navigator_2_with_router/global_states/books_state.dart'; // imported this to use the Books type

class BookListScreen extends StatelessWidget {
  final void Function(int bookId, String path) onBookTapped;
  final VoidCallback onCartTapped;
  const BookListScreen({super.key, required this.onBookTapped, required this.onCartTapped});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator 2.0 demo Book store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // navigate to cart screen declaratively.
              onCartTapped();
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Consumer<Books>(
            builder: (context, books, child) {
              return ListTile(
                leading: const Icon(
                  Icons.square,
                ),
                title: Text(
                  books.books[index].title,
                  style: TextStyle(
                    color: Color.fromARGB(255, 37, 153, 37),
                  ),
                ),
                subtitle: Text(
                  books.books[index].author,
                  style: TextStyle(
                    color: Color.fromARGB(255, 44, 44, 44),
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    // configure adding a book to cart
                  },
                  child: const Text('Add To cart'),
                ),
                onTap: () {
                  // navigate to detail screen declaratively and show the content of the book associated with the given id
                  onBookTapped(books.books[index].id, ScreensPath.details);
                },
              );
            },
          );
        },
      ),
    );
  }
}
