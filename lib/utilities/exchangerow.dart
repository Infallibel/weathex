import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import '../utilities/const.dart';

class ExchangeRow extends StatelessWidget {
  const ExchangeRow(
      {super.key, this.flagCode, this.currency, this.currencyValue});

  final String? flagCode;
  final String? currency;
  final String? currencyValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flag.fromString(
          flagCode!,
          height: 80,
          width: 120,
        ),
        SizedBox(
          width: 190,
          child: Text(
            '1 $currency',
            style: kTextStyleExchange,
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xff21275B),
                    border: Border.all(color: Colors.white, width: 1.0)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 36.0, right: 36.0, top: 4),
                  child: Text(
                    '$currencyValue',
                    style: const TextStyle(
                      fontFamily: 'Dongle',
                      fontSize: 55,
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              'PLN',
              style: kTextStyleExchange,
            )
          ],
        )
      ],
    );
  }
}
