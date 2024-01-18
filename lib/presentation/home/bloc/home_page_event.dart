part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object?> get props => [];
}

final class GetAllAppointmentsPageEvent extends HomePageEvent {
  const GetAllAppointmentsPageEvent();
}

final class DeleteAppointmentPageEvent extends HomePageEvent {
  const DeleteAppointmentPageEvent(this.appointmentId);

  final int appointmentId;

  @override
  List<Object?> get props => [appointmentId];
}
