
import 'package:agenda_app/domain/entities/appointment.dart';

abstract class Database {
  Future<List<Appointment>> getAllAppointments();
  Future<int> insertAppointment(Appointment appointment);
  Future<int> deleteAppointment(int id);
  Future<bool> isCourtAvailable(DateTime date, String courtName);
}
