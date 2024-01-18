import 'package:agenda_app/domain/usecases/delete_appointment.dart';
import 'package:agenda_app/domain/usecases/get_all_appointments.dart';
import 'package:agenda_app/presentation/home/widgets/home_body.dart';
import 'package:agenda_app/presentation/new_appointment/new_appointment_feature.dart';
import 'package:agenda_app/presentation/home/bloc/home_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(
        getAppointmentsUseCase: context.read<GetAllAppointments>(),
        deleteAppointmentUseCase: context.read<DeleteAppointment>(),
      )..add(
          const GetAllAppointmentsPageEvent(),
        ),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            body: const HomePageView(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              tooltip: 'Agendar',
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewAppointmentFeature()),
                );
                context
                    .read<HomePageBloc>()
                    .add(const GetAllAppointmentsPageEvent());
              },
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
        );
      }),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((HomePageBloc b) => b.state.status);
    return status == HomePageStatus.initial
        ? const Center(child: CircularProgressIndicator())
        : const HomeBody();
  }
}
