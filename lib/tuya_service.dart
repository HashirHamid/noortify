import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class TuyaService {
  final String accessId = "d8j5gr5d37fnep58ykqa";
  final String accessSecret = "fd3442773d624952bdcced5cc54e0d52";
  final String region = "https://openapi.tuyacn.com"; // Verify your region

  late String token;

  String generateSign({
    required String method,
    required String path,
    String body = "", // Empty for GET, required for POST
    required String accessId,
    required String accessSecret,
    required String timestamp,
    String? accessToken, // Add this for signed requests
  }) {
    String contentHash = sha256.convert(utf8.encode(body)).toString();
    String stringToSign = [method, contentHash, "", path].join("\n");

    // If accessToken exists, it must be included in the signStr
    String signStr = accessToken != null
        ? accessId + accessToken + timestamp + stringToSign
        : accessId + timestamp + stringToSign;

    var key = utf8.encode(accessSecret);
    var bytes = utf8.encode(signStr);

    var hmacSha256 = Hmac(sha256, key);
    var digest = hmacSha256.convert(bytes);

    return digest.toString().toUpperCase(); // Tuya expects uppercase
  }

  Map<String, String> generateHeaders({
    required String method,
    required String path,
    String body = "",
    String? accessToken, // Add this for signed requests
  }) {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String sign = generateSign(
      method: method,
      path: path,
      body: body,
      accessId: accessId,
      accessSecret: accessSecret,
      timestamp: timestamp,
      accessToken: accessToken, // Pass token when available
    );

    Map<String, String> headers = {
      "t": timestamp,
      "sign_method": "HMAC-SHA256",
      "client_id": accessId,
      "sign": sign,
      "Content-Type": "application/json",
    };

    if (accessToken != null) {
      headers["access_token"] = accessToken;
    }

    return headers;
  }

  Future<void> authenticate() async {
    try {
      String path = "/v1.0/token?grant_type=1";
      final headers = generateHeaders(method: "GET", path: path);

      final response = await http.get(
        Uri.parse("$region$path"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data["success"] == true) {
          token = data["result"]["access_token"];
          print("✅ Authenticated successfully: $token");
        } else {
          print("❌ Auth Error: ${data['msg']}");
        }
      } else {
        print("❌ API Response Error: ${response.body}");
      }
    } catch (e) {
      print("❌ Exception: $e");
    }
  }

  Future<List<dynamic>> getDevices() async {
    try {
      String path = "/v1.0/devices/vdevo174284229473451";
      final headers = generateHeaders(
        method: "GET",
        path: path,
        accessToken: token, // Include token in signed request
      );

      final response = await http.get(
        Uri.parse("$region$path"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        if (data["success"] == true) {
          print("✅ Devices fetched successfully: ${data['result']}");
          return data["result"]["list"] ?? [];
        } else {
          print("❌ Device Fetch Error: ${data['msg']}");
        }
      } else {
        print("❌ API Response Error: ${response.body}");
      }
    } catch (e) {
      print("❌ Device Fetch Exception: $e");
    }
    return [];
  }

  Future<void> controlLock(String deviceId, bool open) async {
    try {
      String path = "/v1.0/devices/$deviceId/commands";
      String body = jsonEncode({
        "commands": [
          {"code": "switch", "value": open}
        ]
      });
      final headers = generateHeaders(
        method: "POST",
        path: path,
        body: body,
        accessToken: token,
      );

      final response = await http.post(
        Uri.parse("$region$path"),
        headers: headers,
        body: body,
      );

      print("Lock Control Response: ${response.body}");
    } catch (e) {
      print("Lock Control Exception: $e");
    }
  }
}
