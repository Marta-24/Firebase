import 'package:flutter/material.dart';

class SongPage extends StatelessWidget {
  final String title;
  final String artist;

  const SongPage({Key? key, required this.title, required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Title: $title',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Text(
              'Artist: $artist',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}