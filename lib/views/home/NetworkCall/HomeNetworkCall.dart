import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HomeNetworkCall {
  static Future<Map<String, dynamic>> sendAttendanceData(
    String token,
    Map<String, String> body,
  ) async {
    const String _baseUrl =
        'https://dev5.thestaffer.com/api/admin/employee/get-employee-attendance';

    final Map<String, String> _headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: _headers,
      body: body,
    );

    log('Request Body: $body');
    log('Response Status: ${response.statusCode}');
    log('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final parsedResponse = json.decode(response.body);
      return parsedResponse;
    } else {
      throw Exception('Failed to send data: ${response.reasonPhrase}');
    }
  }
}
