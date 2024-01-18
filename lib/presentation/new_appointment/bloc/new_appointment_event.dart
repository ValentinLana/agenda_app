part of 'new_appointment_bloc.dart';

sealed class NewAppointmentEvent extends Equatable {
  const NewAppointmentEvent();

  @override
  List<Object?> get props => [];
}

final class SelectCourtEvent extends NewAppointmentEvent {
  const SelectCourtEvent(this.court);

  final String court;

  @override
  List<Object?> get props => [court];
}

final class SelectDateEvent extends NewAppointmentEvent {
  const SelectDateEvent(this.date);

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class UpdateUserNameEvent extends NewAppointmentEvent {
  const UpdateUserNameEvent(this.userName);

  final String userName;

  @override
  List<Object?> get props => [userName];
}

final class AddAppointmentEvent extends NewAppointmentEvent {
  const AddAppointmentEvent();
}
