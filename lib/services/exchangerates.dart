import 'package:weathex/services/networking.dart';

class ExchangeModel {
  Future<dynamic> getCurrency() async {
    String url = 'https://api.nbp.pl/api/exchangerates/tables/A/?format=json';
    NetworkHelper networkHelper = NetworkHelper(url);
    var exchangeData = await networkHelper.getData();
    return exchangeData;
  }
}
