part of 'home_page_bloc.dart';

enum HomePageStatus { initial, loading, success, failure }

class HomePageState extends Equatable {
  const HomePageState({
    this.status = HomePageStatus.initial,
    this.appointments = const [],
  });

  final HomePageStatus status;
  final List<Appointment> appointments;

  HomePageState copyWith({
    HomePageStatus? status,
    List<Appointment>? appointments,
  }) {
    return HomePageState(
      status: status ?? this.status,
      appointments: appointments ?? this.appointments,
    );
  }

  @override
  List<Object> get props => [
        status,
        appointments,
      ];
}