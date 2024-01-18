import 'dart:async';

import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/usecases/delete_appointment.dart';
import 'package:agenda_app/domain/usecases/get_all_appointments.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';

part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({
    required GetAllAppointments getAppointmentsUseCase,
    required DeleteAppointment deleteAppointmentUseCase,
  })  : _getAppointmentsUseCase = getAppointmentsUseCase,
        _deleteAppointmentUseCase = deleteAppointmentUseCase,
        super(const HomePageState()) {
    on<GetAllAppointmentsPageEvent>(_getAllAppointments);
    on<DeleteAppointmentPageEvent>(_deleteAppointment);
  }

  final GetAllAppointments _getAppointmentsUseCase;
  final DeleteAppointment _deleteAppointmentUseCase;

  Future<void> _getAllAppointments(event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));

    final list = await _getAppointmentsUseCase.execute();

    emit(
      state.copyWith(
        status: HomePageStatus.success,
        appointments: list,
      ),
    );
  }

  Future<void> _deleteAppointment(
      DeleteAppointmentPageEvent event, Emitter<HomePageState> emit) async {
    emit(state.copyWith(status: HomePageStatus.loading));

    await _deleteAppointmentUseCase.execute(event.appointmentId);

    final updatedList = await _getAppointmentsUseCase.execute();

    emit(
      state.copyWith(
        status: HomePageStatus.success,
        appointments: updatedList,
      ),
    );
  }
}
