import 'package:flutter/material.dart';
import 'package:weathex/utilities/exchangerow.dart';
import '../utilities/const.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({Key? key, this.exchangeRates}) : super(key: key);
  final dynamic exchangeRates;

  String reducedCurrency(int index) {
    if (exchangeRates == null) {
      return '-.--';
    } else {
      return (((double.parse(exchangeRates[0]['rates'][index]['mid']
                              .toStringAsFixed(2)) -
                          0.2) *
                      10)
                  .floor() /
              10)
          .toStringAsFixed(2);
    }
  }

  Text textWithOrWithoutData() {
    if (exchangeRates == null) {
      return const Text(
        'UNABLE TO GET EXCHANGE RATES',
        style: kTextStyleExchange,
      );
    } else {
      return const Text(
        'EXCHANGE RATES | KURSY WYMIANY',
        style: kTextStyleExchange,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff0057FE),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                color: const Color(0xff2A3469),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    textWithOrWithoutData(),
                    ExchangeRow(
                      flagCode: 'eu',
                      currency: 'EURO',
                      currencyValue: reducedCurrency(7),
                    ),
                    const Divider(
                      height: 2,
                      thickness: 2.5,
                      indent: 8,
                      endIndent: 8,
                      color: Colors.white,
                    ),
                    ExchangeRow(
                        flagCode: 'gb',
                        currency: 'GBP',
                        currencyValue: reducedCurrency(10)),
                    const Divider(
                      height: 2,
                      thickness: 2.5,
                      indent: 8,
                      endIndent: 8,
                      color: Colors.white,
                    ),
                    ExchangeRow(
                        flagCode: 'us',
                        currency: 'US DOLLAR',
                        currencyValue: reducedCurrency(1))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
