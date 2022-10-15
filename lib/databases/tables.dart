import 'package:drift/drift.dart';

import 'dart:io';
import 'package:drift/native.dart';
import 'package:jpstockmemo2/models/memos.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'tables.g.dart';

@DriftDatabase(
  tables: [Memos],
)
class MemoDatabase extends _$MemoDatabase {
  MemoDatabase()
      : super(
          _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  Future<List<Memo>> getMemos() async {
    return await select(memos).get();
  }

  Future<Memo> getMemo(String code) async {
    return await (select(memos)
          ..where(
            (tbl) => tbl.code.equals(code),
          ))
        .getSingle();
  }

  Future<bool> updateMemo(MemosCompanion entity) async {
    return await update(memos).replace(entity);
  }

  Future<int> insertMemo(MemosCompanion entity) async {
    return await into(memos).insert(entity);
  }

  Future<int> deleteMemo(String code) async {
    return await (delete(memos)
          ..where(
            (tbl) => tbl.code.equals(code),
          ))
        .go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(
    () async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(
        path.join(dbFolder.path, 'memos.sqlite'),
      );
      return NativeDatabase(file);
    },
  );
}
