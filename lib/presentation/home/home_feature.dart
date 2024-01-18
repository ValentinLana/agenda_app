import 'package:agenda_app/domain/repositories/appointments_repository.dart';
import 'package:agenda_app/domain/usecases/delete_appointment.dart';
import 'package:agenda_app/domain/usecases/get_all_appointments.dart';
import 'package:agenda_app/presentation/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFeature extends StatelessWidget {
  const HomeFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<AppointmentsRepository>();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: GetAllAppointments(repository: repository),
        ),
        RepositoryProvider.value(
          value: DeleteAppointment(repository: repository),
        ),
      ],
      child: const HomePage(),
    );
  }
}
