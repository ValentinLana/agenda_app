import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrecipitationProbabilities extends StatelessWidget {
  const PrecipitationProbabilities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewAppointmentBloc>(),
      buildWhen: (NewAppointmentState previous, NewAppointmentState current) {
        return previous.probabilityOfPrecipitation !=
            current.probabilityOfPrecipitation;
      },
      builder: (context, NewAppointmentState state) {
        if (state.probabilityOfPrecipitation == null) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Text(
            'Hay un ${state.probabilityOfPrecipitation}% de probabilidad de lluvia para la fecha seleccionada',
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
