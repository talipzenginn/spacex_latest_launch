import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/response_model.dart';
import '../../../../core/init/network/network_manager.dart';

class HomeViewmodel with ChangeNotifier {
  Future getResponse() async {
    Response response = await NetworkManager.instance!.get(
      'latest',
      Response.fromJson,
    );
    return response;
  }

  launchWebsite(String url) async {
    await launch(url);
  }
}
