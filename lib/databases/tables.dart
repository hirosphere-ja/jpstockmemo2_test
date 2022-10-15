import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'tables.g.dart';

class Memos extends Table {
  IntColumn get code => integer()();
  TextColumn get stockname => text()();

  @override
  Set<Column> get primaryKey => {code};
}

@DriftDatabase(tables: [Memos])
class MemoDatabase extends _$MemoDatabase {
  MemoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
