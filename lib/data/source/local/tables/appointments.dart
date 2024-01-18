import 'package:drift/drift.dart';

class Appointments extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get court => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get userName => text()();
  RealColumn get precipitationProbabilities => real()();
}