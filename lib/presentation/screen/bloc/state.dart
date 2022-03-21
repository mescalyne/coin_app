import 'package:untitled/data/models/coin.dart';

class HomeState {
  List<CoinPointDto>? coinHistory;

  HomeState({this.coinHistory});

  HomeState copyWith({List<CoinPointDto>? coinHistory}) {
    return HomeState(
      coinHistory: coinHistory ?? this.coinHistory,
    );
  }
}
