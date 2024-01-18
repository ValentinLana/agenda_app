
import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourtNotAvailable extends StatelessWidget {
  const CourtNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewAppointmentBloc>(),
      buildWhen: (NewAppointmentState previous, NewAppointmentState current) {
        return previous.dateAvailable != current.dateAvailable;
      },
      builder: (context, NewAppointmentState state) {
        if (state.dateAvailable == null || state.dateAvailable!) {
          return const SizedBox.shrink();
        }
        return const Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 10),
          child: Text(
            'La cancha que has elegido no se encuentra disponible en la fecha seleccionada.',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}