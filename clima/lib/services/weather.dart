import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String apiKey;
const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  String city;
  int condition;
  int temperature;

  Location _location;

  WeatherModel({this.city, this.condition, this.temperature});

  Future<dynamic> getCityWeather(String city) async {
    apiKey = DotEnv().env['API_KEY'];

    return await NetworkClient('$baseUrl?q=$city&appid=$apiKey&units=metric')
        .getData();
  }

  Future<dynamic> getLocationWeather() async {
    _location = Location();

    await _location.getCurrentLocation();

    apiKey = DotEnv().env['API_KEY'];

    NetworkClient networkClient = NetworkClient(
      '$baseUrl?lat=${_location.latitude}&lon=${_location.longitude}&appid=$apiKey&units=metric',
    );

    return await networkClient.getData();
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    if (temperature > 25) {
      return 'It\'s 🍦 time';
    } else if (temperature > 20) {
      return 'Time for shorts and 👕';
    } else if (temperature < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
