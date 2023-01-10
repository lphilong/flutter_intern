import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:work/src/constants/constants.dart';

class ApiHandler {
  static final client = http.Client();
  static const storage = FlutterSecureStorage();
  static Future<String> post(var body, String endpoint) async {
    var res = await client.post(buildUrl(endpoint),
        body: body, headers: {"Content-type": "application/json"});
    switch (res.statusCode) {
      case 200:
        return res.body;
      case 401:
        return res.body;
      case 400:
        return res.body;
      case 500:
        return res.body;
      default:
        throw Exception('wrong call api');
    }
  }

  static Future<dynamic> get(String endpoint, String? token) async {
    var res = await client.get(buildUrl(endpoint), headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer $token"
    });
    switch (res.statusCode) {
      case 200:
        return res.body;
      case 401:
        return res.body;
      case 500:
        return res.body;
      default:
        throw Exception('API error');
    }
  }

  static Uri buildUrl(String endpoint) {
    final apiPath = apiUrl + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: "token");
  }
}
