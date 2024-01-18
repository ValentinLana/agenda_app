import 'package:agenda_app/data/source/local/database.dart';
import 'package:agenda_app/data/source/network/api.dart';
import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/entities/weather.dart';
import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final Api _api;
  final Database _database;

  AppointmentsRepositoryImpl({
    required Api api,
    required Database database,
  })  : _api = api,
        _database = database;

  @override
  Future<List<Appointment>> getAllAppointments() async {
    return _database.getAllAppointments();
  }
  
  @override
  Future<int> deleteAppointment(int id) {
    return _database.deleteAppointment(id);
  }
  
  @override
  Future<int> addAppointment(Appointment appointment) {
    return _database.insertAppointment(appointment);
  }
  
  @override
  Future<bool> checkAvailability(DateTime date, String court) {
    return _database.isCourtAvailable(date, court);
  }
  
  @override
  Future<Weather?> checkWeather(DateTime date) {
    return _api.getWeather(date);
  }

}
