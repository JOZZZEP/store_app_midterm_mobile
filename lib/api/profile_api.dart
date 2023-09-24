import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/profile.dart';

class ProfileAPI {
  static const String url = "https://fakestoreapi.com/users/1";

  static Future<Profile> getProfile() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        return parseProfile(response.body);
      } else {
        return Profile();
      }
    } catch (e) {
      return Profile();
    }
  }

  static Profile parseProfile(String responseBody) {
    final Map<String, dynamic> parsed = json.decode(responseBody);
    return Profile.fromJson(parsed);
  }
}
