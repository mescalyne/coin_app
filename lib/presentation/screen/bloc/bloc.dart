import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:untitled/data/models/coin.dart';
import 'package:untitled/data/repository/coin_restapi.dart';
import 'package:untitled/data/repository/coin_websocket.dart';
import 'package:untitled/presentation/screen/bloc/event.dart';
import 'package:untitled/presentation/screen/bloc/state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final CoinWebSocketRepository _coinWebSocket;
  final CoinRestApiRepository _coinRestApi;

  HomeBloc(this._coinWebSocket, this._coinRestApi)
      : super(
          HomeState(),
        ) {
    on<SetCoinEvent>(_setCoin);
  }

  Future<void> _setCoin(
    SetCoinEvent event,
    Emitter<HomeState> emit,
  ) async {
    _coinWebSocket.setCoin(event.coin);
    var coinHistory = await _coinRestApi.getCoinHistory(event.coin);
    emit(HomeState(coinHistory: coinHistory));
  }

  Stream<CoinDto> get coinStream => _coinWebSocket.coinStream;
}
