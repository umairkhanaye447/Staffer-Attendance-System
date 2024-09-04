import 'package:http/http.dart' as http;
import 'package:timeclock/Network_Constant/network_constant.dart';

class Login_NetworkCall {
  static Future<http.Response> login(
      {required String email, required String password}) async {
    var request = http.Request(
        'POST', Uri.parse(NetworkConstants.BASE_URL + NetworkConstants.LOGIN));
    request.bodyFields = {'email': email, 'password': password};
    request.headers.addAll({
      'Accept': 'application/json',
    });
    http.StreamedResponse response = await request.send();
    var a = await http.Response.fromStream(response);
    return a;
  }
}
