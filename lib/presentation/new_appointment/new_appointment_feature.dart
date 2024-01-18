import 'package:agenda_app/domain/repositories/appointments_repository.dart';
import 'package:agenda_app/domain/usecases/add_appointment.dart';
import 'package:agenda_app/domain/usecases/check_availability.dart';
import 'package:agenda_app/domain/usecases/check_weather.dart';
import 'package:agenda_app/presentation/new_appointment/view/new_appointment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewAppointmentFeature extends StatelessWidget {
  const NewAppointmentFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<AppointmentsRepository>();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: CheckWeather(repository: repository),
        ),
        RepositoryProvider.value(
          value: CheckAvailability(repository: repository),
        ),
        RepositoryProvider.value(
          value: AddAppointment(repository: repository),
        ),
      ],
      child: const NewAppointmentPage(),
    );
  }
}
