import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameTextFormField extends StatelessWidget {
  const UserNameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.person, color: Colors.grey),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            onChanged: (value) => context
                .read<NewAppointmentBloc>()
                .add(UpdateUserNameEvent(value)),
            decoration: InputDecoration(
              labelText: 'Nombre del Usuario',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa el nombre del usuario';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
