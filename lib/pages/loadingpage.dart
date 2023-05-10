import 'package:weathex/services/weather.dart';
import 'package:flutter/material.dart';
import 'weatherpage.dart';
import 'package:weathex/services/exchangerates.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'exchangepage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  List<Widget> _pages = [];

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _updateData();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(now.year, now.month, now.day, 1, 0);
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }
    Duration duration = scheduledTime.difference(now);

    _timer = Timer.periodic(duration, (Timer timer) {
      _updateData();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  Future<void> _updateData() async {
    var weatherData = await WeatherModel().getWeather();
    var weatherDataPL = await WeatherModel().getWeatherPL();
    var exchangeRates = await ExchangeModel().getCurrency();

    WeatherPage weatherPage = WeatherPage(
      weatherData: weatherData,
      weatherDataPL: weatherDataPL,
    );

    WeatherPage weatherPagePL = WeatherPage(
      weatherData: weatherData,
      weatherDataPL: weatherDataPL,
      languagePL: true,
    );

    ExchangePage exchangePage = ExchangePage(
      exchangeRates: exchangeRates,
    );

    setState(() {
      _pages = [weatherPage, weatherPagePL, exchangePage];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_pages.isEmpty) {
      return Center(
        child: SpinKitThreeBounce(
          duration: const Duration(milliseconds: 750),
          itemBuilder: (BuildContext context, int index) {
            List<Color> colors = [
              Colors.white,
              Colors.black,
              Colors.amber,
            ];
            return DecoratedBox(
              decoration: BoxDecoration(
                color: colors[index % colors.length],
              ),
            );
          },
        ),
      );
    } else {
      return GestureDetector(
        child: CarouselSlider(
          items: _pages,
          options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 1600),
              viewportFraction: 1,
              autoPlayCurve: Curves.decelerate),
        ),
        onDoubleTap: () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        },
      );
    }
  }
}
