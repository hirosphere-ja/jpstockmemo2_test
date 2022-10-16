import 'package:flutter/material.dart';
import 'package:jpstockmemo2/databases/tables.dart';
import 'package:jpstockmemo2/route/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // late MemoDatabase db = MemoDatabase();
  // final allMemos = await db.getMemos();
  // debugPrint('Memos in database: $allMemos');
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
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
