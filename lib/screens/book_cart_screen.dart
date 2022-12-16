import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/global_states/cart_state.dart';
import 'package:provider/provider.dart';

class BookCartScreen extends StatelessWidget {
  const BookCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<Cart>(builder: (context, cart, child) {
        if (cart.books.isEmpty) {
          return Center(
            child: Text(
              'Empty Cart',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(8),
          children: [
            for (var book in cart.books)
              ListTile(
                title: Text(book.title),
                subtitle: Text(book.author),
              )
          ],
        );
      }),
    );
  }
}
