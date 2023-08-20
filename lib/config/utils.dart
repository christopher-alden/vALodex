import 'dart:convert';
import 'package:flutter/services.dart';

class Utils {
  static Future<List<Map<String, dynamic>>> loadCarouselData(
      String path) async {
    final String jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.cast<Map<String, dynamic>>();
  }

  static Future<Map<String, dynamic>?> loadSpecificData(
      String path, String key) async {
    final String jsonString = await rootBundle.loadString(path);
    final List<dynamic> jsonData = json.decode(jsonString);
    final Map<String, dynamic> charactersMap = jsonData[0];

    return charactersMap[key];
  }
}
