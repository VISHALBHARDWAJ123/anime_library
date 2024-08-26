import 'package:anime_library/utils/app_export.dart';

class HttpRequest {
  static final _client = Client();
  static final String _baseUrl = EnviornmentHelper.returnApiSchema();

  /// /*Get Request*/
  static Future<dynamic> getRequest(
      {required String endpointWithValues,
      Map<String, String> headers = const {}}) async {
    final url = Uri.parse('$_baseUrl$endpointWithValues');

    final response = await _client.get(url, headers: headers);
    print(response.body);
    return jsonDecode(response.body);
  }

  /// /*Post Request*/
  static Future<dynamic> postRequest(
      {required String endpoint,
      required Map<String, String> body,
      Map<String, String>? headers = const {}}) async {
    final url = Uri.parse('$_baseUrl$endpoint');

    final response = await _client.post(
      url,
      headers: headers,
      body: body,
    );

    return jsonDecode(response.body);
  }

  /// /*Disconnect the client */
  static Future<void> disconnect() async {
    _client.close();
  }
}
