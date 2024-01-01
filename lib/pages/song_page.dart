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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
        title: const Text(
          'Now Playing',
          style: TextStyle(
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
                color: Colors.yellow,
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
                  const Icon(Icons.shuffle, color: Colors.white), 
                  const Icon(Icons.replay, color: Colors.white),
                  const Icon(Icons.add, color: Colors.white),
                ],
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    widget.lyrics.isEmpty ? 'Lyrics not available' : widget.lyrics,
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