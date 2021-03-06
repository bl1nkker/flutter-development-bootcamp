import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const API_KEY = '7d1666e631b0987960986abde6965cc0';
const OPEN_WEATHER_MAP_URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$OPEN_WEATHER_MAP_URL?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric');
    return await networkHelper.getData();
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$OPEN_WEATHER_MAP_URL?q=$cityName&appid=$API_KEY&units=metric';

    NetworkHelper networkHelper = NetworkHelper(url);
    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
