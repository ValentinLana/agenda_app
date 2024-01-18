import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourtDropdown extends StatelessWidget {
  const CourtDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.sports_tennis, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Seleccionar Cancha',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: ['A', 'B', 'C'].map((cancha) {
              return DropdownMenuItem<String>(
                value: cancha,
                child: Text(cancha),
              );
            }).toList(),
            onChanged: (value) {
              if (value == null) return;
              context.read<NewAppointmentBloc>().add(SelectCourtEvent(value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor selecciona una cancha';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}