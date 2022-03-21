abstract class HomeEvent {}

class SetCoinEvent extends HomeEvent {
  final String coin;
  SetCoinEvent({required this.coin});
}
