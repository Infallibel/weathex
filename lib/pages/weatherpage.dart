import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weathex/utilities/weatherrow.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage(
      {Key? key, this.weatherData, this.weatherDataPL, this.languagePL = false})
      : super(key: key);
  final dynamic weatherData;
  final dynamic weatherDataPL;
  final bool languagePL;

  final List<String?> weekdays = [];
  final List<String?> dates = [];
  final List<int?> weatherImageNumbers = [];
  final List<int?> temperaturesDay = [];
  final List<int?> temperaturesNight = [];
  final List<String?> descriptions = [];
  final List<int?> precipitationProbabilities = [];
  final List<WeatherRow> weatherRowList = [];

  WeatherRow weatherRowWithData(int index) {
    dynamic dataWeather = languagePL ? weatherDataPL : weatherData;
    if (dataWeather == null) {
      weatherRowList.add(const WeatherRow(
        weekday: '-',
        date: '-',
        weatherImageNumber: 1,
        temperatureDay: 0,
        temperatureNight: 0,
        description: 'Unable to get weather data',
        precipitationProbability: 0,
      ));
      return weatherRowList[0];
    } else {
      for (var i = 0; i < dataWeather['DailyForecasts'].length; i++) {
        final dateString = dataWeather['DailyForecasts'][i]['Date'];
        final date = DateTime.parse(dateString);
        final formattedDate =
            DateFormat(languagePL ? 'd.MM' : 'M/d').format(date);

        final formattedWeekday = DateFormat('EEE').format(date);
        weekdays.add(languagePL
            ? (formattedWeekday == 'Mon'
                ? 'PON.'
                : (formattedWeekday == 'Tue'
                    ? 'WT.'
                    : (formattedWeekday == 'Wed'
                        ? 'ŚR.'
                        : (formattedWeekday == 'Thu'
                            ? 'CZW.'
                            : (formattedWeekday == 'Fri'
                                ? 'PT.'
                                : (formattedWeekday == 'Sat'
                                    ? 'SOB.'
                                    : (formattedWeekday == 'Sun'
                                        ? 'NIEDZ.'
                                        : formattedWeekday)))))))
            : formattedWeekday);
        dates.add(formattedDate);
        weatherImageNumbers
            .add(dataWeather['DailyForecasts'][i]['Day']['Icon']);
        double tempDay =
            dataWeather['DailyForecasts'][i]['Temperature']['Maximum']['Value'];
        temperaturesDay.add(tempDay.round());
        double tempNight =
            dataWeather['DailyForecasts'][i]['Temperature']['Minimum']['Value'];
        temperaturesNight.add(tempNight.round());
        descriptions
            .add(dataWeather['DailyForecasts'][i]['Day']['ShortPhrase']);
        precipitationProbabilities.add(dataWeather['DailyForecasts'][i]['Day']
            ['PrecipitationProbability']);
        weatherRowList.add(WeatherRow(
          weekday: weekdays[i],
          date: dates[i],
          weatherImageNumber: weatherImageNumbers[i],
          temperatureDay: temperaturesDay[i],
          temperatureNight: temperaturesNight[i],
          description: descriptions[i],
          precipitationProbability: precipitationProbabilities[i],
        ));
      }
      return weatherRowList[index];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            weatherRowWithData(0),
            const SizedBox(
              height: 4,
            ),
            weatherRowWithData(1),
            const SizedBox(
              height: 4,
            ),
            weatherRowWithData(2),
            const SizedBox(
              height: 4,
            ),
            weatherRowWithData(3),
            const SizedBox(
              height: 4,
            ),
            weatherRowWithData(4),
          ],
        ),
      ),
    );
  }
}
