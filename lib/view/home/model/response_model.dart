import 'dart:collection';

class Response {
  String? name;
  String? details;
  String? patchUrl;
  String? webcastUrl;

  Response({this.name, this.details, this.patchUrl,this.webcastUrl});

  factory Response.fromJson(Map<String, dynamic> json) {
    LinkedHashMap<dynamic, dynamic> links = json['links'];
    var linksMap = HashMap.from(links);
    String smallPatch = linksMap['patch']['small'];
    String webcastUrl = linksMap['webcast'];

    return Response(
      name: json['name'],
      details: json['details'],
      patchUrl: smallPatch,
      webcastUrl: webcastUrl,
    );
  }
}
