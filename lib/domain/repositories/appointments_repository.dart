
import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/entities/weather.dart';

abstract class AppointmentsRepository {
  Future<List<Appointment>> getAllAppointments();
  Future<int> deleteAppointment(int id);
  Future<bool> checkAvailability(DateTime date, String court);
  Future<Weather?> checkWeather(DateTime date);
  Future<int> addAppointment(Appointment appointment);
}