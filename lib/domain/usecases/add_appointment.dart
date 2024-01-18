import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class AddAppointment {
  AddAppointment({
    required AppointmentsRepository repository,
  }) : _repository = repository;

  final AppointmentsRepository _repository;

  Future<int> execute(Appointment appointment) async {
    return await _repository.addAppointment(appointment);
  }
}
