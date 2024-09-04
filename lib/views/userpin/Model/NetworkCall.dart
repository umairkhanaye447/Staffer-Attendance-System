import 'package:http/http.dart' as http;
import 'dart:convert';

class UserIdNetworkCall {
  static Future<Map<String, dynamic>> userIdData(
      String token, String id) async {
    var url = Uri.parse(
        "https://dev5.thestaffer.com/api/admin/employee/get-employee-record?employee_id=$id");
    var headers = {'Authorization': 'Bearer $token'};
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return {}; // Return an empty map if the response is not successful
    }
  }
}
