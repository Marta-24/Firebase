import 'dart:convert';
import 'package:http/http.dart' as http;

class LyricsService {
  Future<String> fetchLyrics(String artist, String title) async {
    final response = await http.get(Uri.parse('https://api.lyrics.ovh/v1/$artist/$title'));

    if (response.statusCode == 200) {
      return json.decode(response.body)['lyrics'];
    } else {
      throw Exception('Failed to load lyrics');
    }
  }
}