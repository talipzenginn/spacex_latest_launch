import 'dart:collection';

class ResponseModel {
  String? name;
  String? details;
  String? patchUrl;
  String? webcastUrl;

  ResponseModel({this.name, this.details, this.patchUrl,this.webcastUrl});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    LinkedHashMap<dynamic, dynamic> links = json['links'];
    var linksMap = HashMap.from(links);
    String smallPatch = linksMap['patch']['small'];
    String webcastUrl = linksMap['webcast'];

    return ResponseModel(
      name: json['name'],
      details: json['details'],
      patchUrl: smallPatch,
      webcastUrl: webcastUrl,
    );
  }
}
