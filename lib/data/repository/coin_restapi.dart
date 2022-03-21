import 'package:injectable/injectable.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:untitled/data/services/coin_restapi.dart';

abstract class CoinRestApiRepository {
  Future<List<CoinPointDto>> getCoinHistory(String pair);
}

@Injectable(as: CoinRestApiRepository)
class CoinRestApiRepositoryImpl implements CoinRestApiRepository {
  final CoinRestApi _coinRestApi;

  CoinRestApiRepositoryImpl(this._coinRestApi);

  @override
  Future<List<CoinPointDto>> getCoinHistory(String pair) =>
      _coinRestApi.getCoinHistory(pair);
}
