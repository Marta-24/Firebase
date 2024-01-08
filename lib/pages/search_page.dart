import 'package:flutter/material.dart';
import '../app/lyrics_service.dart';
import 'song_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _artistController = TextEditingController();
  final _songController = TextEditingController();
  final _lyricsService = LyricsService();
  bool _isLoading = false;
  String _errorMessage = '';

  void _searchSong() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    if (_artistController.text.isEmpty || _songController.text.isEmpty) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Please enter both artist and song title';
      });
      return;
    }

    try {
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
            playlists: [],
          ),
        ),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load lyrics';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Search'),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
