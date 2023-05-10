import 'package:flutter/material.dart';

class WeatherRow extends StatelessWidget {
  const WeatherRow(
      {super.key,
      this.weekday,
      this.date,
      this.weatherImageNumber,
      this.temperatureDay,
      this.temperatureNight,
      this.description,
      this.precipitationProbability});

  final String? weekday;
  final String? date;
  final int? weatherImageNumber;
  final int? temperatureDay;
  final int? temperatureNight;
  final String? description;
  final int? precipitationProbability;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Theme(
        data: ThemeData.light(),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white60),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: SizedBox(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${weekday?.toUpperCase()}',
                        style: const TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$date',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Image.asset(
                  'assets/weatherimages/$weatherImageNumber.png',
                  scale: 0.8,
                ),
              ),
              Flexible(
                flex: 11,
                child: SizedBox(
                  width: 160,
                  child: Row(
                    textBaseline: TextBaseline.ideographic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        '$temperatureDay°',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 50,
                            fontFamily: 'DM Sans'),
                      ),
                      Text(
                        '/$temperatureNight°',
                        style: const TextStyle(
                            color: Colors.black45, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 20,
                child: SizedBox(
                  width: 280,
                  child: Text(
                    '$description',
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontFamily: 'IBM Plex Sans Condensed'),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      color: Colors.black45,
                    ),
                    Text(
                      '$precipitationProbability%',
                      style:
                          const TextStyle(color: Colors.black45, fontSize: 15),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
