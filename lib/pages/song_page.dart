import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPage extends StatefulWidget {
  final String title;
  final String artist;
  final String lyrics;
  final List<String> playlists;

  const SongPage({
    Key? key,
    required this.title,
    required this.artist,
    required this.lyrics,
    required this.playlists,
  }) : super(key: key);

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.title) ?? false;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.title, isFavorite);
    });
  }

  void _addToPlaylist() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add to Playlist'),
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.playlists.map((playlist) {
                return ListTile(
                  title: Text(playlist),
                  onTap: () {
                    // TODO: Implement logic to add song to this playlist
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
        title: Text(
          'Now Playing',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                color: Colors.yellow, // Placeholder for album art
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.artist,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: _toggleFavorite,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Colors.white),
                    onPressed: () {}, // Placeholder for shuffle functionality
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay, color: Colors.white),
                    onPressed: () {}, // Placeholder for replay functionality
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add, color: Colors.white),
                    onPressed: _addToPlaylist,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.lyrics.isEmpty
                        ? 'Lyrics not available'
                        : widget.lyrics,
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
