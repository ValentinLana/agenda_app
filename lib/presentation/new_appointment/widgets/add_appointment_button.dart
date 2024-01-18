import 'package:agenda_app/presentation/new_appointment/bloc/new_appointment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddApointmentButton extends StatelessWidget {
  const AddApointmentButton(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<NewAppointmentBloc>(),
      builder: (BuildContext context, NewAppointmentState state) {
        return Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    side:  BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(1, 50)),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 24.0,
                ),
                label: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(1, 50)),
                onPressed: state.dateAvailable != null
                    ? state.dateAvailable != false
                        ? () async {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<NewAppointmentBloc>()
                                  .add(const AddAppointmentEvent());
                              Navigator.pop(context);
                            }
                          }
                        : null
                    : null,
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                ),
                label: const Text(
                  'Agendar',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}