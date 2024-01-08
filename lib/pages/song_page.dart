import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SongPage extends StatefulWidget {
  final String title;
  final String artist;
  final String lyrics;

  const SongPage({
    Key? key,
    required this.title,
    required this.artist,
    required this.lyrics,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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

  Future<void> _addToPlaylist() async {
    final prefs = await SharedPreferences.getInstance();
    final playlists = prefs.getStringList('playlists') ?? [];

    if (playlists.isEmpty) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('No Playlists Available'),
            content: const Text('You do not have any playlists to add this song to.'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add to Playlist'),
          content: SingleChildScrollView(
            child: ListBody(
              children: playlists.map((playlist) {
                return ListTile(
                  title: Text(playlist),
                  onTap: () {
                    _addSongToPlaylist(playlist, widget.title);
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

  Future<void> _addSongToPlaylist(String playlistName, String songTitle) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> currentSongs = prefs.getStringList(playlistName) ?? [];
    if (!currentSongs.contains(songTitle)) {
      currentSongs.add(songTitle);
      await prefs.setStringList(playlistName, currentSongs);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Color.fromARGB(255, 234, 229, 229),
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
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                    image: NetworkImage('URL of album art if available'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 234, 229, 229),
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
                      color: Color.fromARGB(255, 234, 229, 229),
                    ),
                    onPressed: _toggleFavorite,
                  ),
                  IconButton(
                    icon: const Icon(Icons.shuffle, color: Color.fromARGB(255, 234, 229, 229)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay, color: Color.fromARGB(255, 234, 229, 229)),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.playlist_add, color: Color.fromARGB(255, 234, 229, 229)),
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
                    style: const TextStyle(fontSize: 16.0, color: Color.fromARGB(255, 234, 229, 229)),
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
