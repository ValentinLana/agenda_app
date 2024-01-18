import 'package:agenda_app/presentation/new_appointment/widgets/add_appointment_button.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/appointment_date_picker.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/court_dropdown.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/court_not_available.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/precipitation_probabilities.dart';
import 'package:agenda_app/presentation/new_appointment/widgets/user_name_textformfield.dart';
import 'package:flutter/material.dart';

class NewAppointmentForm extends StatefulWidget {
  const NewAppointmentForm({super.key});

  @override
  State<NewAppointmentForm> createState() => _NewAppointmentFormState();
}

class _NewAppointmentFormState extends State<NewAppointmentForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CourtDropdown(),
            const SizedBox(height: 20),
            const AppointmentDatePicker(),
            const SizedBox(height: 20),
            const UserNameTextFormField(),
            const SizedBox(height: 20),
            const PrecipitationProbabilities(),
            const CourtNotAvailable(),
            AddApointmentButton(_formKey),
          ],
        ),
      ),
    );
  }
}