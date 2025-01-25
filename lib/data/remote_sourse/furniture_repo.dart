import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FurnitureRepo {
  static const String _baseUrl = "https://e-commerce.birnima.uz/api";

  static Future<List<dynamic>> getFurnitures() async {
    final url = Uri.parse("$_baseUrl/products");
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        final payload = jsonDecode(response.body)["data"];

        return payload;
      } else {
        throw Exception("Failed to load furniture");
      }
    } catch (e) {
      throw Exception("Error fetching furniture");
    }
  }

  static Future<List<dynamic>> getBanner() async {
    final url = Uri.parse("$_baseUrl/banner");
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final response = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      if (response.statusCode == 200) {
        log(response.body);
        final payload = jsonDecode(response.body)["data"];

        return payload;
      } else {
        throw Exception("Failed to load furniture");
      }
    } catch (e) {
      throw Exception("Error fetching furniture");
    }
  }

  static Future<Map<String, dynamic>> logIn(
      String phoneNumber, String password) async {
    final url = Uri.parse("$_baseUrl/auth/signin");
    final data = {
      "auth_method": "phone-number",
      "password": password,
      "phone_number": phoneNumber,
      "email": ""
    };
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 201) {
        final payload = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", payload["data"]["access_token"]);
        return payload;
      } else {
        throw Exception("Failed to log in");
      }
    } catch (e) {
      throw Exception("Error logging in");
    }
  }

  static Future<Map<String, dynamic>> signUp(
      String phoneNumber, String password) async {
    final url = Uri.parse("$_baseUrl/auth/signup");
    final data = {
      "phone_number": phoneNumber,
      "email": "",
      "auth_method": "phone-number",
      "password": password
    };
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      log("nimadir");
      log("response ${response.statusCode}");
      if (response.statusCode == 201) {
        final payload = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", payload["data"]["access_token"]);
        log(response.body);
        return payload;
      } else {
        throw Exception("Failed to sign up");
      }
    } catch (e) {
      throw Exception("Error signing up");
    }
  }
}
