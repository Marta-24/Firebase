import 'package:flutter/material.dart';
import '../app/lyrics_service.dart';
import 'song_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _artistController = TextEditingController();
  final _songController = TextEditingController();
  final _lyricsService = LyricsService();

  void _searchSong() async {
    final lyrics = await _lyricsService.fetchLyrics(
      _artistController.text,
      _songController.text,
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SongPage(
          artist: _artistController.text,
          title: _songController.text,
          lyrics: lyrics,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Song')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _artistController,
              decoration: const InputDecoration(labelText: 'Artist'),
            ),
            TextField(
              controller: _songController,
              decoration: const InputDecoration(labelText: 'Song Title'),
            ),
            ElevatedButton(
              onPressed: _searchSong,
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}