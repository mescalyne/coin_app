class CoinDto {
  String? type;
  String? assetIdBase;
  String? assetIdQuote;
  String? time;
  double? rate;

  CoinDto(
      {this.type, this.assetIdBase, this.assetIdQuote, this.time, this.rate});

  CoinDto.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    time = json['time'];
    rate = json['rate'].toDouble();
  }
}

class CoinPointDto {
  String? timeClose;
  double? rateClose;

  CoinPointDto({this.timeClose, this.rateClose});

  CoinPointDto.fromJson(Map<String, dynamic> json) {
    timeClose = json['time_close'];
    rateClose = json['rate_close'];
  }
}