// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../data/repository/coin_restapi.dart' as _i4;
import '../../../data/repository/coin_websocket.dart' as _i6;
import '../../../data/services/coin_restapi.dart' as _i3;
import '../../../data/services/coin_websocket.dart' as _i5;
import '../../screen/bloc/bloc.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.CoinRestApi>(() => _i3.CoinRestApiImpl());
  gh.factory<_i4.CoinRestApiRepository>(
      () => _i4.CoinRestApiRepositoryImpl(get<_i3.CoinRestApi>()));
  gh.lazySingleton<_i5.CoinWebSocket>(() => _i5.CoinWebSocketImpl());
  gh.factory<_i6.CoinWebSocketRepository>(
      () => _i6.CoinWebSocketRepositoryImpl(get<_i5.CoinWebSocket>()));
  gh.factory<_i7.HomeBloc>(() => _i7.HomeBloc(
      get<_i6.CoinWebSocketRepository>(), get<_i4.CoinRestApiRepository>()));
  return get;
}
