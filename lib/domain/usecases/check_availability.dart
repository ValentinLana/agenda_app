import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class CheckAvailability {
  CheckAvailability({
    required AppointmentsRepository repository,
  }) : _repository = repository;

  final AppointmentsRepository _repository;

  Future<bool> execute(DateTime date, String court) async {
    return await _repository.checkAvailability(date, court);
  }
}
