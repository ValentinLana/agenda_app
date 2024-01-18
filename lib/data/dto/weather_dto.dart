import 'dart:convert';

import 'package:agenda_app/domain/entities/weather.dart';

WeatherDto weatherDtoFromJson(String str) =>
    WeatherDto.fromJson(json.decode(str));

String weatherDtoToJson(WeatherDto data) => json.encode(data.toJson());

class WeatherDto extends Weather {
  WeatherDto({
    required super.queryCost,
    required super.latitude,
    required super.longitude,
    required super.resolvedAddress,
    required super.address,
    required super.timezone,
    required super.tzoffset,
    required super.days,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) => WeatherDto(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        timezone: json["timezone"],
        tzoffset: json["tzoffset"],
        days: List<Day>.from(json["days"].map((x) => Day.fromJson(x))),
      );
}
