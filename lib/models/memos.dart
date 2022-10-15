import 'package:drift/drift.dart';

class Memos extends Table {
  IntColumn get code => integer()();
  TextColumn get stockname => text()();

  @override
  Set<Column> get primaryKey => {code};
}
