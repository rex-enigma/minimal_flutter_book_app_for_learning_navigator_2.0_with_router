import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/models/screen_paths.dart';

// This class is used by Router widget to parse route information into user-defined data type.
class BookRouteInformationParser extends RouteInformationParser<BookRoutePath> {
  // The routeNameProvider will listen to operating system events and when path of string type is emitted it will
  // inflate it into RouteInformation, which then Router widget will call parseRouteInformation with that RouteInformation
  // so that it can be parsed.
  // This delegate turns the RouteInformation gotten from routeNameProvider into parsed
  // route data of type T (BookRoutePath).
  @override
  Future<BookRoutePath> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    // handle '/'
    if (uri.pathSegments.isEmpty) {
      return BookRoutePath.home();
    }
    // handle '/book/:id'
    if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'book') {
      var rest = uri.pathSegments[1];
      int? id = int.tryParse(rest);
      if (id == null) return BookRoutePath.home();
      return BookRoutePath.details(id);
    }
    // handle '/cart'
    else if (uri.pathSegments[0] == 'cart') {
      return BookRoutePath.cart();
    }

    // handle the rest
    return BookRoutePath.home();
  }

  @override
  RouteInformation? restoreRouteInformation(BookRoutePath configuration) {
    // TODO: implement restoreRouteInformation
    return super.restoreRouteInformation(configuration);
  }
}

//
class BookRoutePath {
  final int? id;
  final String screenPath;

  BookRoutePath.home()
      : id = null,
        screenPath = ScreensPath.home;
  BookRoutePath.details(this.id) : screenPath = ScreensPath.details;
  BookRoutePath.cart()
      : id = null,
        screenPath = ScreensPath.cart;

  bool get isHomeScreen => screenPath == '/';
  bool get isDetailsScreen => screenPath == '/book' && id != null;
  bool get isCartScreen => screenPath == '/cart';
}
