part of 'new_appointment_bloc.dart';

enum NewAppointmentStatus { initial, loading, success, failure }

class NewAppointmentState extends Equatable {
  const NewAppointmentState({
    this.status = NewAppointmentStatus.initial,
    this.selectedCourt,
    this.selectedDate,
    this.dateAvailable,
    this.probabilityOfPrecipitation,
    this.userName,
  });

  final NewAppointmentStatus status;
  final String? selectedCourt;
  final DateTime? selectedDate;
  final bool? dateAvailable;
  final double? probabilityOfPrecipitation;
  final String? userName;

  NewAppointmentState copyWith({
    NewAppointmentStatus? status,
    String? selectedCourt,
    DateTime? selectedDate,
    bool? dateAvailable,
    double? probabilityOfPrecipitation,
    String? userName,
  }) {
    return NewAppointmentState(
      status: status ?? this.status,
      selectedCourt: selectedCourt ?? this.selectedCourt,
      selectedDate: selectedDate ?? this.selectedDate,
      dateAvailable: dateAvailable ?? this.dateAvailable,
      probabilityOfPrecipitation:
          probabilityOfPrecipitation ?? this.probabilityOfPrecipitation,
      userName: userName ?? this.userName,
    );
  }

  @override
  List<Object?> get props => [
        status,
        selectedCourt,
        selectedDate,
        dateAvailable,
        probabilityOfPrecipitation,
        userName,
      ];
}
