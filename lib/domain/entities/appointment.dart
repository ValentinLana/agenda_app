class Appointment {
  final int? id;
  final String court;
  final DateTime date;
  final String userName;
  final double precipitationProbabilities;

  Appointment({
    this.id,
    required this.court,
    required this.date,
    required this.userName,
    required this.precipitationProbabilities,
  });
}
