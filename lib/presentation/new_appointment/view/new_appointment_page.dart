import 'package:agenda_app/domain/usecases/add_appointment.dart';
import 'package:agenda_app/domain/usecases/check_availability.dart';
import 'package:agenda_app/domain/usecases/check_weather.dart';
import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/new_appointment_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewAppointmentPage extends StatelessWidget {
  const NewAppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewAppointmentBloc(
        addAppointmentUseCase: context.read<AddAppointment>(),
        checkAvailabilityUseCase: context.read<CheckAvailability>(),
        checkWeatherUseCase: context.read<CheckWeather>(),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Agendar nueva reserva'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          body: const NewAppointmentForm()),
    );
  }
}
