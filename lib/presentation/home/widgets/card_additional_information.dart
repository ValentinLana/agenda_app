import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardAdditionalInformation extends StatelessWidget {
  const CardAdditionalInformation({super.key, required this.appointment});

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('EEEE, d MMM', 'es_ES').format(appointment.date);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 241, 241),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Row(
            children: [
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              Text(
                formattedDate,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                const Icon(
                  Icons.cloud_outlined,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  '${appointment.precipitationProbabilities}%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
