// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<String> playlists = []; // List to hold playlists

  Future<void> _showAddPlaylistDialog(BuildContext context) async {
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
              onPressed: () => _showAddPlaylistDialog(context),
              child: const Text('Add Playlist'),
            ),
          ),
          Expanded(
            child: playlists.isNotEmpty
                ? ListView.builder(
                    itemCount: playlists.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  playlists[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              setState(() {
                                playlists.removeAt(index);
                              });
                            },
                          ),
                        ],
                      );
                    },
                  )
                : Center(child: Text("No playlists created yet.", style: TextStyle(color: Colors.white))),
          ),
        ],
      ),
    );
  }
}