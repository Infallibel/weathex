import 'package:weathex/services/networking.dart';

const apiKey = 'PslGVggAyj8wyAiLOYgWDrVyrNaU93ui';
const accuweatherURL =
    'http://dataservice.accuweather.com/forecasts/v1/daily/5day';
const krakowKey = '274455';

class WeatherModel {
  Future<dynamic> getWeather() async {
    String url =
        '$accuweatherURL/$krakowKey?apikey=$apiKey&details=true&metric=true';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherPL() async {
    String url =
        '$accuweatherURL/$krakowKey?apikey=$apiKey&language=pl&details=true&metric=true';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherDataPL = await networkHelper.getData();
    return weatherDataPL;
  }
}
