import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:untitled/data/models/coin.dart';

abstract class CoinRestApi {
  Future<List<CoinPointDto>> getCoinHistory(String pair);
}

@LazySingleton(as: CoinRestApi)
class CoinRestApiImpl implements CoinRestApi {
  @override
  Future<List<CoinPointDto>> getCoinHistory(String pair) async {
    DateTime today = DateTime.now();
    String timeStart =
        DateTime(today.year, today.month - 1, today.day).toIso8601String();
    timeStart = timeStart.substring(0, 19);
    String timeEnd = today.toIso8601String();
    timeEnd = timeEnd.substring(0,19);

    final uri = Uri.http('rest.coinapi.io', '/v1/exchangerate/$pair/history', {
      'period_id': '1DAY',
      'time_start': timeStart,
      'time_end': timeEnd,
    });
    var result = await http.get(
      uri,
      headers: {'X-CoinAPI-Key': '87EA78B9-3853-4781-A960-FE7F715985EC'},
    );
    List<CoinPointDto> coinHistory = [];
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      data.forEach(
          (element) => coinHistory.add(CoinPointDto.fromJson(element)));
    }
    return coinHistory;
  }
}
