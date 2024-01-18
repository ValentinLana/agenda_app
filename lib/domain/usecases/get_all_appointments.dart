import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class GetAllAppointments {
  GetAllAppointments({
    required AppointmentsRepository repository,
  }) : _repository = repository;

  final AppointmentsRepository _repository;

  Future<List<Appointment>> execute() async {
    return await _repository.getAllAppointments();
  }
}
