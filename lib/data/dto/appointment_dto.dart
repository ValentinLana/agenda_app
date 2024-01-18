import 'package:agenda_app/domain/entities/appointment.dart';

class AppointmentDto extends Appointment {
  AppointmentDto({
    required super.id,
    required super.court,
    required super.date,
    required super.userName,
    required super.precipitationProbabilities,
  });
}
