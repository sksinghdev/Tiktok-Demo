import 'package:videoplay/model/media_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotFoundException implements Exception {
  String cause;

  NotFoundException(this.cause);
}

class Api {
  static Future<List<media_model>> getProfile(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return parsePhotos2(response.body);
    } else {
      if (response.statusCode == 400) {
        throw NotFoundException("NOT_FOUND");
      }
      throw Exception("Unable to load ${response.toString()}");
    }
  }
 static  List<media_model> parsePhotos2(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<media_model>((json) => media_model.fromJson(json)).toList();
  }

  static List<media_model> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<media_model>((json) => media_model.fromJson(json)).toList();
  }

  static Future<List<media_model>> fetchPhotos(http.Client client) async {
    final response =
    await client.get('https://www.pinkvilla.com/feed/video-test/video-feed.json');

    return parsePhotos(response.body);
  }
}
