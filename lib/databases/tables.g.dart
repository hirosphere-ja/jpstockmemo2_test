// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Memo extends DataClass implements Insertable<Memo> {
  final int id;
  final String code;
  final String stockname;
  final String memo;
  const Memo(
      {required this.id,
      required this.code,
      required this.stockname,
      required this.memo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['code'] = Variable<String>(code);
    map['stockname'] = Variable<String>(stockname);
    map['memo'] = Variable<String>(memo);
    return map;
  }

  MemosCompanion toCompanion(bool nullToAbsent) {
    return MemosCompanion(
      id: Value(id),
      code: Value(code),
      stockname: Value(stockname),
      memo: Value(memo),
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memo(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      stockname: serializer.fromJson<String>(json['stockname']),
      memo: serializer.fromJson<String>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'stockname': serializer.toJson<String>(stockname),
      'memo': serializer.toJson<String>(memo),
    };
  }

  Memo copyWith({int? id, String? code, String? stockname, String? memo}) =>
      Memo(
        id: id ?? this.id,
        code: code ?? this.code,
        stockname: stockname ?? this.stockname,
        memo: memo ?? this.memo,
      );
  @override
  String toString() {
    return (StringBuffer('Memo(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('stockname: $stockname, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, code, stockname, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          other.id == this.id &&
          other.code == this.code &&
          other.stockname == this.stockname &&
          other.memo == this.memo);
}

class MemosCompanion extends UpdateCompanion<Memo> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> stockname;
  final Value<String> memo;
  const MemosCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.stockname = const Value.absent(),
    this.memo = const Value.absent(),
  });
  MemosCompanion.insert({
    this.id = const Value.absent(),
    required String code,
    required String stockname,
    required String memo,
  })  : code = Value(code),
        stockname = Value(stockname),
        memo = Value(memo);
  static Insertable<Memo> custom({
    Expression<int>? id,
    Expression<String>? code,
    Expression<String>? stockname,
    Expression<String>? memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (stockname != null) 'stockname': stockname,
      if (memo != null) 'memo': memo,
    });
  }

  MemosCompanion copyWith(
      {Value<int>? id,
      Value<String>? code,
      Value<String>? stockname,
      Value<String>? memo}) {
    return MemosCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      stockname: stockname ?? this.stockname,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (stockname.present) {
      map['stockname'] = Variable<String>(stockname.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemosCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('stockname: $stockname, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

class $MemosTable extends Memos with TableInfo<$MemosTable, Memo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 4, maxTextLength: 4),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  final VerificationMeta _stocknameMeta = const VerificationMeta('stockname');
  @override
  late final GeneratedColumn<String> stockname = GeneratedColumn<String>(
      'stockname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, code, stockname, memo];
  @override
  String get aliasedName => _alias ?? 'memos';
  @override
  String get actualTableName => 'memos';
  @override
  VerificationContext validateIntegrity(Insertable<Memo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('stockname')) {
      context.handle(_stocknameMeta,
          stockname.isAcceptableOrUnknown(data['stockname']!, _stocknameMeta));
    } else if (isInserting) {
      context.missing(_stocknameMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Memo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memo(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      code: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      stockname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}stockname'])!,
      memo: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}memo'])!,
    );
  }

  @override
  $MemosTable createAlias(String alias) {
    return $MemosTable(attachedDatabase, alias);
  }
}

abstract class _$MemoDatabase extends GeneratedDatabase {
  _$MemoDatabase(QueryExecutor e) : super(e);
  late final $MemosTable memos = $MemosTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [memos];
}
