import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherMapAPIURL?q=$cityName&appid=$kAPIKey&units=imperial');
    return await networkHelper.getData();
  }

  Future<dynamic> getLocationWeather([Location location]) async {
    location = location ?? Location();
    await location.updateCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        '$kOpenWeatherMapAPIURL?lat=${location.latitude}&lon=${location.longitude}&appid=$kAPIKey&units=imperial');
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
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

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
