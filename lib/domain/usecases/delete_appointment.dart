import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class DeleteAppointment {
  DeleteAppointment({
    required AppointmentsRepository repository,
  }) : _repository = repository;

  final AppointmentsRepository _repository;

  Future<int> execute(int id) async {
    return await _repository.deleteAppointment(id);
  }
}
