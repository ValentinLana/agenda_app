import 'package:agenda_app/data/dto/weather_dto.dart';
import 'package:agenda_app/data/source/network/api.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiImpl implements Api {
  final dio = Dio();

  @override
  Future<WeatherDto?> getWeather(DateTime date) async {
    try {
      Response response;
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      response = await dio.get(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/Mendoza,Ar/${formatter.format(date)}?key=PPKRNYUUQ6WJG34Q58LPMUDA5');

      final weatherDto = WeatherDto.fromJson(response.data);
      return weatherDto;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);

        if (e.response?.statusCode == 404) return null;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }

    return null;
  }
}
