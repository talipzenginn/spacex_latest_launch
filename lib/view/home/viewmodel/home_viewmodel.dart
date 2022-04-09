import 'package:url_launcher/url_launcher.dart';
import '../../../../core/init/network/network_manager.dart';
import '../../../core/init/navigation/router.gr.dart';
import '../../../main.dart';
import '../model/response_model.dart';

class HomeViewmodel {
  Future getResponse() async {
    ResponseModel response;
    try {
      response = await NetworkManager.instance!.get(
        'latest',
        ResponseModel.fromJson,
      );
    } catch (e) {
      rethrow;
    }
    return response;
  }

  launchWebsite(String url) async {
    await launch(url);
  }

  tryAgain() {
    router.replace(
      const SplashRoute(),
    );
  }
}
