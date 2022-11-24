import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiHandler {
  static final client = http.Client();
  static final storage = FlutterSecureStorage();
  static Future<String> post(var body, String endpoint) async {
    var res = await client.post(buildUrl(endpoint),
        body: body, headers: {"Content-type": "application/json"});
    return res.body;
  }

  static Uri buildUrl(String endpoint) {
    String url = "http://localhost:8081/";
    final apiPath = url + endpoint;
    return Uri.parse(apiPath);
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken(String token) async {
    return await storage.read(key: "token");
  }
}
