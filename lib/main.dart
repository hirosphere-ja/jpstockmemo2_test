import 'package:flutter/material.dart';
import 'package:jpstockmemo2/views/edit_page.dart';
import 'package:jpstockmemo2/views/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const ListPage(),
        '/editpage': (context) => const EditPage(),
      },
    );
  }
}
