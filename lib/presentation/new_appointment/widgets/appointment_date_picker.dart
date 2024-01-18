import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDatePicker extends StatelessWidget {
  const AppointmentDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewAppointmentBloc>(),
      buildWhen: (NewAppointmentState previous, NewAppointmentState current) {
        return previous.selectedDate != current.selectedDate;
      },
      builder: (BuildContext context, NewAppointmentState state) {
        return Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.grey),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: TextEditingController(
                  text: state.selectedDate?.toString().split(' ')[0] ?? '',
                ),
                readOnly: true,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final pickedDate = await showDatePicker(
                    context: context,
                    initialDate: state.selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2025),
                  );
                  if (pickedDate == null) return;
                  context
                      .read<NewAppointmentBloc>()
                      .add(SelectDateEvent(pickedDate));
                },
                decoration: InputDecoration(
                  labelText: 'Seleccionar Fecha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Por favor selecciona una fecha'
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }
}
