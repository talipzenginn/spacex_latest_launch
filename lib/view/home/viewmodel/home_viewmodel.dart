import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/response_model.dart';
import '../../../../core/init/network/network_manager.dart';

class HomeViewmodel with ChangeNotifier {
  Future getResponse() async {
    ResponseModel response = await NetworkManager.instance!.get(
      'latest',
      ResponseModel.fromJson,
    );
    return response;
  }

  launchWebsite(String url) async {
    await launch(url);
  }
}
