import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/router/route_information_parser.dart';
import 'package:navigator_2_with_router/data_models/screen_paths.dart';
import 'package:navigator_2_with_router/screens/book_list_screen.dart';
import 'package:navigator_2_with_router/screens/book_cart_screen.dart';
import 'package:navigator_2_with_router/screens/book_details_screen.dart';

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

  //handling diff screens navigation using a single variable.
  String? _selectedScreenPath;
  // the id shall be used by the detailsScreen to get a specific book from app state / global state
  // late means that the variable will have a value assigned to it before  any part of the our code uses it
  late int _selectedBookId;

  BookRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        // you can extend Page to create your custom page. Here we are using  what is shipped with the sdk
        MaterialPage(
          key: ValueKey('BookListPage'),
          child: BookListScreen(
            onBookTapped: _handleBookTapped,
            onCartTapped: _handleCartTapped,
          ),
        ),
        if (_selectedScreenPath != null && _selectedScreenPath == ScreensPath.details)
          MaterialPage(
            key: ValueKey('BookDetailPage'),
            child: BookDetailsScreen(bookId: _selectedBookId),
          )
        else if (_selectedScreenPath != null && _selectedScreenPath == ScreensPath.cart)
          MaterialPage(
            key: ValueKey('BookCartscreen'),
            child: BookCartScreen(),
          ),
      ],
      // The navigator calls this method - usually in response to a Navigator.pop call - to ask that the given Route
      // corresponding to a Page should be popped.
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedScreenPath = null;
        notifyListeners();

        return true;
      },
    );
  }

// the body of this method contains logic for updating _selectedBookId and  _selectedScreenPath
// which are responsible for reconfiguring the navigator
  @override
  Future<void> setNewRoutePath(BookRoutePath path) async {
    if (path.isDetailsScreen) {
      _selectedScreenPath = path.screenPath;
      _selectedBookId = path.id!;
      return;
    } else if (path.isCartScreen) {
      _selectedScreenPath = path.screenPath;
      return;
    }

    _selectedScreenPath = path.screenPath;
  }

  void _handleBookTapped(int bookId, String path) {
    _selectedBookId = bookId;
    _selectedScreenPath = path;
    // this will notify Router widget. Router Widget will rebuild requesting a new navigator by calling the above build method.
    notifyListeners();
  }

  void _handleCartTapped() {
    _selectedScreenPath = ScreensPath.cart;
    notifyListeners();
  }
}
