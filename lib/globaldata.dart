import 'fetchdatafromserver/extractresponse.dart';

class GlobalData {
  int? id;
  String name;
  String symbol;
  String slug;
  int? rank;
  int? isActive;
  DateTime? firstHistoricalData;
  DateTime? lastHistoricalData;
  Platform? platform;


  GlobalData({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.rank,
    required this.isActive,
    required this.firstHistoricalData,
    required this.lastHistoricalData,
    required this.platform,
  });
}
