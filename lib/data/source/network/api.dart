
import 'package:agenda_app/data/dto/weather_dto.dart';

abstract class Api {
  Future<WeatherDto?> getWeather(DateTime date);
}