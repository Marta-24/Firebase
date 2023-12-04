import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 176, 137, 0),
          ),
        ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 29, 34, 73),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 39, 48),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 53, 61, 131),
                  width: 4.0,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Search for songs...',
                  hintStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 50.0),

            const PlaylistContainer(
              title: 'Playlist 1',
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 25.0),
            const PlaylistContainer(
              title: 'Playlist 2',
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 25.0),
            const PlaylistContainer(
              title: 'Playlist 3',
              backgroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class PlaylistContainer extends StatelessWidget {
  final String title;
  final Color backgroundColor;

  const PlaylistContainer({
    Key? key,
    required this.title,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}