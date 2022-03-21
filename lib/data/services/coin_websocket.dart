import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final channel = WebSocketChannel.connect(
  Uri.parse(
      'ws://ws-sandbox.coinapi.io/v1/?apikey=87EA78B9-3853-4781-A960-FE7F715985EC'),
);

abstract class CoinWebSocket {
  void add(String coin);
  void close();
  Stream<CoinDto> get coinStream;
}

@LazySingleton(as: CoinWebSocket)
class CoinWebSocketImpl implements CoinWebSocket {
  @override
  void add(String coin) {
    channel.sink.add(jsonEncode({
      "type": "hello",
      "apikey": "87EA78B9-3853-4781-A960-FE7F715985EC",
      "heartbeat": false,
      "subscribe_data_type": ["exrate"],
      "subscribe_filter_asset_id": [coin]
    }));
  }

  @override
  void close() {
    channel.sink.close();
  }

  @override
  Stream<CoinDto> get coinStream => channel.stream
      .map<CoinDto>((value) => CoinDto.fromJson(jsonDecode(value)));
}
