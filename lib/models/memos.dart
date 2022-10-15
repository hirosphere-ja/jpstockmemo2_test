import 'package:drift/drift.dart';

class Memos extends Table {
  TextColumn get code => text().withLength(max: 4, min: 4)();
  TextColumn get stockname => text()();

  @override
  Set<Column> get primaryKey => {code};
}
