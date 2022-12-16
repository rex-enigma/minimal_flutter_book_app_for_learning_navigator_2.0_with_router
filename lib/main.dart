import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/screens/book_cart_screen.dart';
import 'package:provider/provider.dart';
import 'package:navigator_2_with_router/global_states/books_state.dart';
import 'package:navigator_2_with_router/global_states/cart_state.dart';
import 'package:navigator_2_with_router/screens/book_list_screen.dart';
import 'package:navigator_2_with_router/router/route_information_parser.dart';
import 'package:navigator_2_with_router/router/router_delegate.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Cart()),
      ChangeNotifierProvider(create: (context) => Books()),
    ],
    child: const BookApp(),
  ));
}

class BookApp extends StatefulWidget {
  const BookApp({super.key});

  @override
  State<BookApp> createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
  BookRouterDelegate _routerDelegate = BookRouterDelegate();
  BookRouteInformationParser _routeInformationParser = BookRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BookApp',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
