import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/presentation/home/widgets/card_additional_information.dart';
import 'package:agenda_app/presentation/home/widgets/card_delete_button.dart';
import 'package:agenda_app/presentation/home/widgets/card_header.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment});

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          CardHeader(appointment: appointment),
          const SizedBox(height: 20),
          CardAdditionalInformation(appointment: appointment),
          const SizedBox(height: 20),
          CardDeleteButton(
            appointment: appointment,
          )
        ],
      ),
    );
  }
}


