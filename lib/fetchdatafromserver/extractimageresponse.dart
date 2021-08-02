
import 'dart:convert';

class ExtractImageResponse {
  ExtractImageResponse({
    this.status,
    this.data,


  });

  Status? status;
  Data? data;


  factory ExtractImageResponse.fromJson(Map<String, dynamic> json,String idd) => ExtractImageResponse(
    status: Status.fromJson(json["status"]),
    data: Data.fromJson(json["data"],idd),

  );

  Map<String, dynamic> toJson() => {
    "status": status!.toJson(),
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.the5,
    required this.iddd,
  });

  The5? the5;
  String iddd;


  factory Data.fromJson(Map<String, dynamic> json,String iddd) => Data(
    the5: The5.fromJson(json[iddd]),
    iddd: iddd,
  );

  Map<String, dynamic> toJson() => {
    iddd: the5!.toJson(),
  };
}

class The5 {
  The5({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
  });

  int? id;
  String? name;
  String? symbol;
  String? category;
  String? description;
  String? slug;
  String? logo;
  String? subreddit;
  String? notice;
  List<String>? tags;
  List<String>? tagNames;
  List<String>? tagGroups;
  Urls? urls;
  dynamic platform;
  DateTime? dateAdded;
  String? twitterUsername;
  int? isHidden;

  factory The5.fromJson(Map<String, dynamic> json) => The5(
    id: json["id"],
    name: json["name"],
    symbol: json["symbol"],
    category: json["category"],
    description: json["description"],
    slug: json["slug"],
    logo: json["logo"],
    subreddit: json["subreddit"],
    notice: json["notice"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    tagNames: List<String>.from(json["tag-names"].map((x) => x)),
    tagGroups: List<String>.from(json["tag-groups"].map((x) => x)),
    urls: Urls.fromJson(json["urls"]),
    platform: json["platform"],
    dateAdded: DateTime.parse(json["date_added"]),
    twitterUsername: json["twitter_username"],
    isHidden: json["is_hidden"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "category": category,
    "description": description,
    "slug": slug,
    "logo": logo,
    "subreddit": subreddit,
    "notice": notice,
    "tags": List<dynamic>.from(tags!.map((x) => x)),
    "tag-names": List<dynamic>.from(tagNames!.map((x) => x)),
    "tag-groups": List<dynamic>.from(tagGroups!.map((x) => x)),
    "urls": urls!.toJson(),
    "platform": platform,
    "date_added": dateAdded!.toIso8601String(),
    "twitter_username": twitterUsername,
    "is_hidden": isHidden,
  };
}

class Urls {
  Urls({
    this.website,
    this.twitter,
    this.messageBoard,
    this.chat,
    this.explorer,
    this.reddit,
    this.technicalDoc,
    this.sourceCode,
    this.announcement,
  });

  List<String>? website;
  List<String>? twitter;
  List<String>? messageBoard;
  List<String>? chat;
  List<String>? explorer;
  List<String>? reddit;
  List<String>? technicalDoc;
  List<String>? sourceCode;
  List<String>? announcement;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    website: List<String>.from(json["website"].map((x) => x)),
    twitter: List<String>.from(json["twitter"].map((x) => x)),
    messageBoard: List<String>.from(json["message_board"].map((x) => x)),
    chat: List<String>.from(json["chat"].map((x) => x)),
    explorer: List<String>.from(json["explorer"].map((x) => x)),
    reddit: List<String>.from(json["reddit"].map((x) => x)),
    technicalDoc: List<String>.from(json["technical_doc"].map((x) => x)),
    sourceCode: List<String>.from(json["source_code"].map((x) => x)),
    announcement: List<String>.from(json["announcement"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "website": List<dynamic>.from(website!.map((x) => x)),
    "twitter": List<dynamic>.from(twitter!.map((x) => x)),
    "message_board": List<dynamic>.from(messageBoard!.map((x) => x)),
    "chat": List<dynamic>.from(chat!.map((x) => x)),
    "explorer": List<dynamic>.from(explorer!.map((x) => x)),
    "reddit": List<dynamic>.from(reddit!.map((x) => x)),
    "technical_doc": List<dynamic>.from(technicalDoc!.map((x) => x)),
    "source_code": List<dynamic>.from(sourceCode!.map((x) => x)),
    "announcement": List<dynamic>.from(announcement!.map((x) => x)),
  };
}

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

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
