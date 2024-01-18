import 'dart:io';

import 'package:agenda_app/data/dto/appointment_dto.dart';
import 'package:agenda_app/data/source/local/database.dart';
import 'package:agenda_app/data/source/local/tables/appointments.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:agenda_app/domain/entities/appointment.dart' as a;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:sqlite3/sqlite3.dart' hide Database;

part 'database_impl.g.dart';

@DriftDatabase(tables: [Appointments])
class DatabaseImpl extends _$DatabaseImpl implements Database {
  DatabaseImpl() : super(_openConnection());

  @override
  Future<List<AppointmentDto>> getAllAppointments() async {
    final savedAppointments = await (select(appointments)
          ..orderBy([(t) => OrderingTerm(expression: t.date, mode: OrderingMode.asc)]))
        .get();
    final appointmentsDto = savedAppointments.map((a) {
      return AppointmentDto(
        id: a.id,
        court: a.court,
        date: a.date,
        userName: a.userName,
        precipitationProbabilities: a.precipitationProbabilities,
      );
    }).toList();

    return appointmentsDto;
  }

  @override
  Future<int> insertAppointment(a.Appointment appointment) {
    return into(appointments).insert(
      AppointmentsCompanion(
        court: Value(appointment.court),
        date: Value(appointment.date),
        userName: Value(appointment.userName),
        precipitationProbabilities:
            Value(appointment.precipitationProbabilities),
      ),
    );
  }

  @override
  Future<int> deleteAppointment(int id) async {
    return (delete(appointments)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<bool> isCourtAvailable(DateTime date, String courtName) async {
    final count = await (select(appointments)
          ..where((a) => a.date.isBiggerOrEqualValue(date))
          ..where((a) =>
              a.date.isSmallerOrEqualValue(date.add(const Duration(days: 1))))
          ..where((a) => a.court.equals(courtName)))
        .get()
        .then((value) => value.length);

    return count < 3;
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
