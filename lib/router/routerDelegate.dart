import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/router/routeInformationParser.dart';
import 'package:navigator_2_with_router/models/book.dart';
import 'package:navigator_2_with_router/models/books.dart';
// check design doc
// this is where we build and configure navigator base on the app state we will provide,
// it contains other methods such as setNewPathRoute, setInitialRoutePath that are called by the Router widget
// in response to operating system events.
// when this delegate wants to change how the navigator is configured(eg changing the list of Pages provided to the navigator)
// it notifies its listeners by calling notifyListeners() inherited from the superclass. Router widget being one
// of the listeners will rebuild and request a new navigator by calling delegate's build method.

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {

  @override
  final GlobalKey<NavigatorState>? navigatorKey;

  Book? _selectedBook;
  bool showCartScreen = false;

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>()

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        // you can extend Page to create your custom page. Here we are using  what is shipped with the sdk
        MaterialPage(
          key: ValueKey('BookListPage'),
          child: BookListScreen(
            books: books,
            onBookTapped: _handleBookTapped,
            onCartTapped: _handleCartTapped,
          ),
          ),
      ],
      onPopPage: (route, result) {
          if (!route.didPop(result)) {
          return false;
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }



  void _handleBookTapped(Book book) {
    _selectedBook = book;
    // this will notify Router widget. Router Widget will rebuild requesting a new navigator by calling the above build method.
    notifyListeners();
  }

  void _handleCartTapped() {
    showCartScreen = true;
    notifyListeners();
  }
}
