// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_impl.dart';

// ignore_for_file: type=lint
class $AppointmentsTable extends Appointments
    with TableInfo<$AppointmentsTable, Appointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courtMeta = const VerificationMeta('court');
  @override
  late final GeneratedColumn<String> court = GeneratedColumn<String>(
      'court', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _precipitationProbabilitiesMeta =
      const VerificationMeta('precipitationProbabilities');
  @override
  late final GeneratedColumn<double> precipitationProbabilities =
      GeneratedColumn<double>('precipitation_probabilities', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, court, date, userName, precipitationProbabilities];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(Insertable<Appointment> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('court')) {
      context.handle(
          _courtMeta, court.isAcceptableOrUnknown(data['court']!, _courtMeta));
    } else if (isInserting) {
      context.missing(_courtMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    } else if (isInserting) {
      context.missing(_userNameMeta);
    }
    if (data.containsKey('precipitation_probabilities')) {
      context.handle(
          _precipitationProbabilitiesMeta,
          precipitationProbabilities.isAcceptableOrUnknown(
              data['precipitation_probabilities']!,
              _precipitationProbabilitiesMeta));
    } else if (isInserting) {
      context.missing(_precipitationProbabilitiesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Appointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appointment(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      court: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}court'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name'])!,
      precipitationProbabilities: attachedDatabase.typeMapping.read(
          DriftSqlType.double,
          data['${effectivePrefix}precipitation_probabilities'])!,
    );
  }

  @override
  $AppointmentsTable createAlias(String alias) {
    return $AppointmentsTable(attachedDatabase, alias);
  }
}

class Appointment extends DataClass implements Insertable<Appointment> {
  final int id;
  final String court;
  final DateTime date;
  final String userName;
  final double precipitationProbabilities;
  const Appointment(
      {required this.id,
      required this.court,
      required this.date,
      required this.userName,
      required this.precipitationProbabilities});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['court'] = Variable<String>(court);
    map['date'] = Variable<DateTime>(date);
    map['user_name'] = Variable<String>(userName);
    map['precipitation_probabilities'] =
        Variable<double>(precipitationProbabilities);
    return map;
  }

  AppointmentsCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsCompanion(
      id: Value(id),
      court: Value(court),
      date: Value(date),
      userName: Value(userName),
      precipitationProbabilities: Value(precipitationProbabilities),
    );
  }

  factory Appointment.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appointment(
      id: serializer.fromJson<int>(json['id']),
      court: serializer.fromJson<String>(json['court']),
      date: serializer.fromJson<DateTime>(json['date']),
      userName: serializer.fromJson<String>(json['userName']),
      precipitationProbabilities:
          serializer.fromJson<double>(json['precipitationProbabilities']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'court': serializer.toJson<String>(court),
      'date': serializer.toJson<DateTime>(date),
      'userName': serializer.toJson<String>(userName),
      'precipitationProbabilities':
          serializer.toJson<double>(precipitationProbabilities),
    };
  }

  Appointment copyWith(
          {int? id,
          String? court,
          DateTime? date,
          String? userName,
          double? precipitationProbabilities}) =>
      Appointment(
        id: id ?? this.id,
        court: court ?? this.court,
        date: date ?? this.date,
        userName: userName ?? this.userName,
        precipitationProbabilities:
            precipitationProbabilities ?? this.precipitationProbabilities,
      );
  @override
  String toString() {
    return (StringBuffer('Appointment(')
          ..write('id: $id, ')
          ..write('court: $court, ')
          ..write('date: $date, ')
          ..write('userName: $userName, ')
          ..write('precipitationProbabilities: $precipitationProbabilities')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, court, date, userName, precipitationProbabilities);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.id == this.id &&
          other.court == this.court &&
          other.date == this.date &&
          other.userName == this.userName &&
          other.precipitationProbabilities == this.precipitationProbabilities);
}

class AppointmentsCompanion extends UpdateCompanion<Appointment> {
  final Value<int> id;
  final Value<String> court;
  final Value<DateTime> date;
  final Value<String> userName;
  final Value<double> precipitationProbabilities;
  const AppointmentsCompanion({
    this.id = const Value.absent(),
    this.court = const Value.absent(),
    this.date = const Value.absent(),
    this.userName = const Value.absent(),
    this.precipitationProbabilities = const Value.absent(),
  });
  AppointmentsCompanion.insert({
    this.id = const Value.absent(),
    required String court,
    required DateTime date,
    required String userName,
    required double precipitationProbabilities,
  })  : court = Value(court),
        date = Value(date),
        userName = Value(userName),
        precipitationProbabilities = Value(precipitationProbabilities);
  static Insertable<Appointment> custom({
    Expression<int>? id,
    Expression<String>? court,
    Expression<DateTime>? date,
    Expression<String>? userName,
    Expression<double>? precipitationProbabilities,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (court != null) 'court': court,
      if (date != null) 'date': date,
      if (userName != null) 'user_name': userName,
      if (precipitationProbabilities != null)
        'precipitation_probabilities': precipitationProbabilities,
    });
  }

  AppointmentsCompanion copyWith(
      {Value<int>? id,
      Value<String>? court,
      Value<DateTime>? date,
      Value<String>? userName,
      Value<double>? precipitationProbabilities}) {
    return AppointmentsCompanion(
      id: id ?? this.id,
      court: court ?? this.court,
      date: date ?? this.date,
      userName: userName ?? this.userName,
      precipitationProbabilities:
          precipitationProbabilities ?? this.precipitationProbabilities,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (court.present) {
      map['court'] = Variable<String>(court.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (precipitationProbabilities.present) {
      map['precipitation_probabilities'] =
          Variable<double>(precipitationProbabilities.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('court: $court, ')
          ..write('date: $date, ')
          ..write('userName: $userName, ')
          ..write('precipitationProbabilities: $precipitationProbabilities')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseImpl extends GeneratedDatabase {
  _$DatabaseImpl(QueryExecutor e) : super(e);
  late final $AppointmentsTable appointments = $AppointmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appointments];
}
