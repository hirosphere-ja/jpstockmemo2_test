// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Memo extends DataClass implements Insertable<Memo> {
  final int code;
  final String stockname;
  const Memo({required this.code, required this.stockname});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<int>(code);
    map['stockname'] = Variable<String>(stockname);
    return map;
  }

  MemosCompanion toCompanion(bool nullToAbsent) {
    return MemosCompanion(
      code: Value(code),
      stockname: Value(stockname),
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Memo(
      code: serializer.fromJson<int>(json['code']),
      stockname: serializer.fromJson<String>(json['stockname']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<int>(code),
      'stockname': serializer.toJson<String>(stockname),
    };
  }

  Memo copyWith({int? code, String? stockname}) => Memo(
        code: code ?? this.code,
        stockname: stockname ?? this.stockname,
      );
  @override
  String toString() {
    return (StringBuffer('Memo(')
          ..write('code: $code, ')
          ..write('stockname: $stockname')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, stockname);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          other.code == this.code &&
          other.stockname == this.stockname);
}

class MemosCompanion extends UpdateCompanion<Memo> {
  final Value<int> code;
  final Value<String> stockname;
  const MemosCompanion({
    this.code = const Value.absent(),
    this.stockname = const Value.absent(),
  });
  MemosCompanion.insert({
    this.code = const Value.absent(),
    required String stockname,
  }) : stockname = Value(stockname);
  static Insertable<Memo> custom({
    Expression<int>? code,
    Expression<String>? stockname,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (stockname != null) 'stockname': stockname,
    });
  }

  MemosCompanion copyWith({Value<int>? code, Value<String>? stockname}) {
    return MemosCompanion(
      code: code ?? this.code,
      stockname: stockname ?? this.stockname,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<int>(code.value);
    }
    if (stockname.present) {
      map['stockname'] = Variable<String>(stockname.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemosCompanion(')
          ..write('code: $code, ')
          ..write('stockname: $stockname')
          ..write(')'))
        .toString();
  }
}

class $MemosTable extends Memos with TableInfo<$MemosTable, Memo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemosTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<int> code = GeneratedColumn<int>(
      'code', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _stocknameMeta = const VerificationMeta('stockname');
  @override
  late final GeneratedColumn<String> stockname = GeneratedColumn<String>(
      'stockname', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [code, stockname];
  @override
  String get aliasedName => _alias ?? 'memos';
  @override
  String get actualTableName => 'memos';
  @override
  VerificationContext validateIntegrity(Insertable<Memo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('stockname')) {
      context.handle(_stocknameMeta,
          stockname.isAcceptableOrUnknown(data['stockname']!, _stocknameMeta));
    } else if (isInserting) {
      context.missing(_stocknameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  Memo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Memo(
      code: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}code'])!,
      stockname: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}stockname'])!,
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
