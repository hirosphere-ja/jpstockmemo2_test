import 'package:flutter/material.dart';
import 'package:jpstockmemo2/views/edit_page.dart';
import 'package:jpstockmemo2/views/error_page.dart';
import 'package:jpstockmemo2/views/list_page.dart';
import 'package:jpstockmemo2/views/grid_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const ListPage(),
        );
      case '/gridpage':
        return MaterialPageRoute(
          builder: (_) => const GridPage(),
        );
      case '/editpage':
        return MaterialPageRoute(
          builder: (_) => const EditPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorPage(),
        );
    }
  }
}
