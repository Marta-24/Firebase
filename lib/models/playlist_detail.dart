import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistDetailPage extends StatelessWidget {
  final String playlistName;

  const PlaylistDetailPage({Key? key, required this.playlistName}) : super(key: key);

  Future<List<String>> _loadPlaylistSongs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(playlistName) ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(playlistName),
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      body: FutureBuilder<List<String>>(
        future: _loadPlaylistSongs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No songs in this playlist.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index],
                    style: const TextStyle(color: Colors.white)),
              );
            },
          );
        },
      ),
    );
  }
}
