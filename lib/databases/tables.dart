import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:jpstockmemo2/models/memos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'tables.g.dart';

@DriftDatabase(tables: [Memos])
class MemoDatabase extends _$MemoDatabase {
  MemoDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'memos.sqlite'));
    return NativeDatabase(file);
  });
}
