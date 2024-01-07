import 'dart:convert';
import 'package:http/http.dart' as http;

class LyricsService {
  Future<String> fetchLyrics(String artist, String title) async {
    final encodedArtist = Uri.encodeComponent(artist);
    final encodedTitle = Uri.encodeComponent(title);

    final url = Uri.parse('https://api.lyrics.ovh/v1/$encodedArtist/$encodedTitle');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return jsonResponse['lyrics'] ?? 'Lyrics not found';
      } else {
        throw Exception('Failed to load lyrics');
      }
    } catch (e) {
      return 'Error fetching lyrics: $e';
    }
  }
}