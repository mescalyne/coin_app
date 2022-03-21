import 'package:injectable/injectable.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:untitled/data/services/coin_websocket.dart';

abstract class CoinWebSocketRepository {
  Future<void> setCoin(String pair);
  Stream<CoinDto> get coinStream;
}

@Injectable(as: CoinWebSocketRepository)
class CoinWebSocketRepositoryImpl implements CoinWebSocketRepository {
  final CoinWebSocket _coinWebSocket;

  CoinWebSocketRepositoryImpl(this._coinWebSocket);

  @override
  Future<void> setCoin(String pair) async {
    _coinWebSocket.add(pair);
  }

  @override
  Stream<CoinDto> get coinStream => _coinWebSocket.coinStream;
}
