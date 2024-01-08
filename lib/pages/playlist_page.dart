import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<String> playlists = []; // List to hold playlist names

  Future<void> _showAddPlaylistDialog() async {
    String playlistName = '';

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('New Playlist'),
          content: TextField(
            onChanged: (value) {
              playlistName = value;
            },
            decoration: const InputDecoration(hintText: "Enter playlist name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Create'),
              onPressed: () {
                if (playlistName.isNotEmpty) {
                  setState(() {
                    playlists.add(playlistName);
                  });
                  Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditPlaylistNameDialog(int index) async {
    String playlistName = playlists[index];

    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Edit Playlist Name'),
          content: TextField(
            onChanged: (value) {
              playlistName = value;
            },
            controller: TextEditingController(text: playlistName),
            decoration:
                const InputDecoration(hintText: "Enter new playlist name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (playlistName.isNotEmpty) {
                  setState(() {
                    playlists[index] = playlistName;
                  });
                  Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlists', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _showAddPlaylistDialog,
              child: const Text('Add Playlist'),
            ),
          ),
          Expanded(
            child: playlists.isNotEmpty
                ? ListView.builder(
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          playlists[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () =>
                                  _showEditPlaylistNameDialog(index),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  playlists.removeAt(index);
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text(
                      "No playlists created yet.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
