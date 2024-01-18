import 'package:agenda_app/presentation/home/bloc/home_page_bloc.dart';
import 'package:agenda_app/presentation/home/widgets/appointment_card.dart';
import 'package:agenda_app/presentation/home/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final list = context.select((HomePageBloc b) => b.state.appointments);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: HomePageHeader(titleText: 'Todos los agendamientos'),
        ),
        if (list.isEmpty)
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'No tienes agendamientos, agrega uno nuevo para verlo aqui!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return AppointmentCard(appointment: list[index]);
            },
          ),
        ),
      ],
    );
  }
}
