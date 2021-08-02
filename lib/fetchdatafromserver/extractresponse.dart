// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class ExtractResponse {
  ExtractResponse({
    this.status,
    this.data,
  });

  Status? status;
  List<Datum>? data;

  factory ExtractResponse.fromJson(Map<String, dynamic> json) => ExtractResponse(
    status: Status.fromJson(json["status"]),
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status!.toJson(),
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.rank,
    this.isActive,
    this.firstHistoricalData,
    this.lastHistoricalData,
    this.platform,
  });

  int? id;
  String? name;
  String? symbol;
  String? slug;
  int? rank;
  int? isActive;
  DateTime? firstHistoricalData;
  DateTime? lastHistoricalData;
  Platform? platform;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    slug: json["slug"],
    rank: json["rank"],
    isActive: json["is_active"],
    firstHistoricalData: DateTime.parse(json["first_historical_data"]),
    lastHistoricalData: DateTime.parse(json["last_historical_data"]),
    platform: json["platform"] == null ? null : Platform.fromJson(json["platform"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "rank": rank,
    "is_active": isActive,
    "first_historical_data": firstHistoricalData!.toIso8601String(),
    "last_historical_data": lastHistoricalData!.toIso8601String(),
    "platform": platform == null ? null : platform!.toJson(),
  };
}

class Platform {
  Platform({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.tokenAddress,
  });

  int? id;
  Name? name;
  Symbol? symbol;
  Slug? slug;
  String? tokenAddress;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json["id"],
    name: nameValues.map[json["name"]],
    symbol: symbolValues.map[json["symbol"]],
    slug: slugValues.map[json["slug"]],
    tokenAddress: json["token_address"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": nameValues.reverse![name],
    "symbol": symbolValues.reverse![symbol],
    "slug": slugValues.reverse![slug],
    "token_address": tokenAddress,
  };
}

enum Name { ETHEREUM, EOS, NEO, BINANCE_CHAIN, BINANCE_SMART_CHAIN, KLAYTN, TRON, STELLAR, CHILIZ, FANTOM, CELO, XDAI_CHAIN, AVALANCHE, SOLANA, HECO, AVALANCHE_CONTRACT_CHAIN, WANCHAIN, IOST, POLYGON, WAVES, CARDANO, KCC, TOMO_CHAIN }

final nameValues = EnumValues({
  "Avalanche": Name.AVALANCHE,
  "Avalanche Contract Chain": Name.AVALANCHE_CONTRACT_CHAIN,
  "Binance Chain": Name.BINANCE_CHAIN,
  "Binance Smart Chain": Name.BINANCE_SMART_CHAIN,
  "Cardano": Name.CARDANO,
  "Celo": Name.CELO,
  "Chiliz": Name.CHILIZ,
  "EOS": Name.EOS,
  "Ethereum": Name.ETHEREUM,
  "Fantom": Name.FANTOM,
  "Heco": Name.HECO,
  "IOST": Name.IOST,
  "KCC": Name.KCC,
  "Klaytn": Name.KLAYTN,
  "Neo": Name.NEO,
  "Polygon": Name.POLYGON,
  "Solana": Name.SOLANA,
  "Stellar": Name.STELLAR,
  "TomoChain": Name.TOMO_CHAIN,
  "Tron": Name.TRON,
  "Wanchain": Name.WANCHAIN,
  "Waves": Name.WAVES,
  "Xdai chain": Name.XDAI_CHAIN
});

enum Slug { ETHEREUM, EOS, NEO, BINANCE_COIN, KLAYTN, TRON, STELLAR, CHILIZ, FANTOM, CELO, XDAI, AVALANCHE, SOLANA, HUOBI_TOKEN, WANCHAIN, IOSTOKEN, POLYGON, WAVES, CARDANO, KUCOIN_TOKEN, TOMOCHAIN }

final slugValues = EnumValues({
  "avalanche": Slug.AVALANCHE,
  "binance-coin": Slug.BINANCE_COIN,
  "cardano": Slug.CARDANO,
  "celo": Slug.CELO,
  "chiliz": Slug.CHILIZ,
  "eos": Slug.EOS,
  "ethereum": Slug.ETHEREUM,
  "fantom": Slug.FANTOM,
  "huobi-token": Slug.HUOBI_TOKEN,
  "iostoken": Slug.IOSTOKEN,
  "klaytn": Slug.KLAYTN,
  "kucoin-token": Slug.KUCOIN_TOKEN,
  "neo": Slug.NEO,
  "polygon": Slug.POLYGON,
  "solana": Slug.SOLANA,
  "stellar": Slug.STELLAR,
  "tomochain": Slug.TOMOCHAIN,
  "tron": Slug.TRON,
  "wanchain": Slug.WANCHAIN,
  "waves": Slug.WAVES,
  "xdai": Slug.XDAI
});

enum Symbol { ETH, EOS, NEO, BNB, KLAY, TRX, XLM, CHZ, FTM, CELO, STAKE, AVAX, SOL, HT, WAN, IOST, MATIC, WAVES, ADA, KCS, TOMO }

final symbolValues = EnumValues({
  "ADA": Symbol.ADA,
  "AVAX": Symbol.AVAX,
  "BNB": Symbol.BNB,
  "CELO": Symbol.CELO,
  "CHZ": Symbol.CHZ,
  "EOS": Symbol.EOS,
  "ETH": Symbol.ETH,
  "FTM": Symbol.FTM,
  "HT": Symbol.HT,
  "IOST": Symbol.IOST,
  "KCS": Symbol.KCS,
  "KLAY": Symbol.KLAY,
  "MATIC": Symbol.MATIC,
  "NEO": Symbol.NEO,
  "SOL": Symbol.SOL,
  "STAKE": Symbol.STAKE,
  "TOMO": Symbol.TOMO,
  "TRX": Symbol.TRX,
  "WAN": Symbol.WAN,
  "WAVES": Symbol.WAVES,
  "XLM": Symbol.XLM
});

class Status {
  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  DateTime? timestamp;
  int? errorCode;
  dynamic errorMessage;
  int? elapsed;
  int? creditCount;
  dynamic notice;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    timestamp: DateTime.parse(json["timestamp"]),
    errorCode: json["error_code"],
    errorMessage: json["error_message"],
    elapsed: json["elapsed"],
    creditCount: json["credit_count"],
    notice: json["notice"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp!.toIso8601String(),
    "error_code": errorCode,
    "error_message": errorMessage,
    "elapsed": elapsed,
    "credit_count": creditCount,
    "notice": notice,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
