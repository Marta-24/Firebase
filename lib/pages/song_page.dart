import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  final String songName;
  final String artistName;

  // ignore: use_key_in_widget_constructors
  const SongPage({required this.songName, required this.artistName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(songName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Song: $songName'),
            Text('Artist: $artistName'),
          ],
        ),
      ),
    );
  }
}