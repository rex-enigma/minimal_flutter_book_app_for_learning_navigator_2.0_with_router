import 'package:flutter/material.dart';
import 'package:navigator_2_with_router/data_models/book.dart';

class Books extends ChangeNotifier {
  List<Book> books = [
    Book(
        id: 0,
        title: 'Dark night diaries',
        author: 'Mark Well',
        content:
            'The Pages API sets the history stack of the Navigator declaratively by taking in a list of Page objects. The Navigator then inflates the Page objects into Route objects. The order of Routes corresponds to the order of Pages in the list provided.'),
    Book(
        id: 1,
        title: 'Learn closures',
        author: 'John Ray',
        content:
            'The Router widget is a dispatcher for opening and closing application pages. It wraps a Navigator and configures its current list of Pages based on the current app state. It also listens to events from the operating system.'),
    Book(
        id: 2,
        title: 'The gears of life',
        author: 'Med Jones',
        content:
            'RouterDelegate: listens to RouteInformationParser and the app state to build an appropriately configured Navigator.'),
    Book(
        id: 3,
        title: 'Imposter among us',
        author: 'Adam Leighn',
        content:
            'The RouterDelegate needs you to add the navigatorKey and implement the build, currentConfiguration, and setNewRoutePath methods.'),
    Book(
        id: 4,
        title: 'World zed',
        author: 'Will Forest',
        content:
            "To set the history stack of the Navigator declaratively, developers will provide a list of Page objects to the Navigator widget in its constructor. Page objects are immutable and describe the route that should be placed into the Navigator's history stack."),
    Book(
        id: 5,
        title: 'The industrial revolution',
        author: 'Kamau James',
        content:
            'The Navigator inflates a Page object into a Route object. In this way, the relationship between Pages and Routes is analogous to the relationship between Widgets and Elements: A Widget or a Page describes a configuration for an actual Element or Route, respectively.'),
    Book(
        id: 6,
        title: 'The gold age',
        author: 'Solomon Vic',
        content:
            'The Pages API sets the history stack of the Navigator declaratively by taking in a list of Page objects. The Navigator then inflates the Page objects into Route objects. The order of Routes corresponds to the order of Pages in the list provided.'),
    Book(
        id: 7,
        title: 'Zen life',
        author: 'June Lee',
        content:
            'The order of Routes corresponding to Pages within the history stack is the same as the order of their corresponding Pages in the list provided to the Navigator. When the list of Pages given to the Navigator is updated, the new list is compared to the old list and the route history is updated accordingly:'),
    Book(
        id: 8,
        title: 'Flutter for beginners',
        author: 'Malcom maina',
        content:
            "Routes belonging to Pages that are no longer present in the new list are removed from the history. Pages, that are present in the new list, but don't have a corresponding Route yet, are inflated and the resulting Route is added to the history at the appropriate location. The order of Routes in the history stack is updated to match the order of their corresponding Pages in the new list."),
    Book(
        id: 9,
        title: 'Working around the moon',
        author: 'Simba king',
        content:
            'A transition delegate decides how Routes, whose Pages were added to or removed from the list, transition on or off the screen (see section "Transition Delegate" below).'),
  ];

  void addBook(Book book) {
    notifyListeners();
  }
}
