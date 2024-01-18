import 'package:agenda_app/domain/entities/weather.dart';
import 'package:agenda_app/domain/repositories/appointments_repository.dart';

class CheckWeather {
  CheckWeather({
    required AppointmentsRepository repository,
  }) : _repository = repository;

  final AppointmentsRepository _repository;

  Future<Weather?> execute(DateTime date) async {
    return await _repository.checkWeather(date);
  }
}
