import 'dart:async';

import 'package:agenda_app/domain/entities/appointment.dart';
import 'package:agenda_app/domain/usecases/add_appointment.dart';
import 'package:agenda_app/domain/usecases/check_availability.dart';
import 'package:agenda_app/domain/usecases/check_weather.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'new_appointment_event.dart';

part 'new_appointment_state.dart';

class NewAppointmentBloc
    extends Bloc<NewAppointmentEvent, NewAppointmentState> {
  NewAppointmentBloc({
    required AddAppointment addAppointmentUseCase,
    required CheckAvailability checkAvailabilityUseCase,
    required CheckWeather checkWeatherUseCase,
  })  : _addAppointmentUseCase = addAppointmentUseCase,
        _checkAvailabilityUseCase = checkAvailabilityUseCase,
        _checkWeatherUseCase = checkWeatherUseCase,
        super(const NewAppointmentState()) {
    on<AddAppointmentEvent>(_addAppointment);
    on<SelectCourtEvent>(_selectedCourt);
    on<SelectDateEvent>(_selectedDate);
    on<UpdateUserNameEvent>(_updateUserName);
  }

  final AddAppointment _addAppointmentUseCase;
  final CheckAvailability _checkAvailabilityUseCase;
  final CheckWeather _checkWeatherUseCase;

  Future<void> _selectedCourt(
      SelectCourtEvent event, Emitter<NewAppointmentState> emit) async {
    emit(state.copyWith(selectedCourt: event.court));

    if (state.selectedDate == null) return;

    emit(state.copyWith(status: NewAppointmentStatus.loading));

    final isAvailable = await _checkAvailabilityUseCase.execute(
      state.selectedDate!,
      event.court,
    );

    emit(
      state.copyWith(
        status: NewAppointmentStatus.success,
        dateAvailable: isAvailable,
      ),
    );
  }

  Future<void> _selectedDate(
      SelectDateEvent event, Emitter<NewAppointmentState> emit) async {
    emit(state.copyWith(
      status: NewAppointmentStatus.loading,
      selectedDate: event.date,
    ));

    final checkWeather = await _checkWeatherUseCase.execute(event.date);

    if (state.selectedCourt == null) {
      emit(state.copyWith(
        status: NewAppointmentStatus.success,
        probabilityOfPrecipitation: checkWeather!.days!.first.precipprob,
      ));
      return;
    }

    final isAvailable = await _checkAvailabilityUseCase.execute(
      event.date,
      state.selectedCourt!,
    );

    emit(
      state.copyWith(
        status: NewAppointmentStatus.success,
        dateAvailable: isAvailable,
        probabilityOfPrecipitation: checkWeather!.days!.first.precipprob,
      ),
    );
  }

  Future<void> _updateUserName(
      UpdateUserNameEvent event, Emitter<NewAppointmentState> emit) async {
    emit(state.copyWith(userName: event.userName));
  }

  Future<void> _addAppointment(
      AddAppointmentEvent event, Emitter<NewAppointmentState> emit) async {
    emit(state.copyWith(status: NewAppointmentStatus.loading));

    await _addAppointmentUseCase.execute(
      Appointment(
          court: state.selectedCourt!,
          date: state.selectedDate!,
          userName: state.userName!,
          precipitationProbabilities: state.probabilityOfPrecipitation!),
    );

    emit(
      state.copyWith(
        status: NewAppointmentStatus.success,
      ),
    );
  }
}
