import 'package:flutter/material.dart';

class MySongPage extends StatelessWidget {
  const MySongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Songs',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                // Album Cover
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://example.com/album_cover.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Song and Artist Information
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Song Name $index',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Artist Name $index',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Play Button
                IconButton(
                  icon:
                      const Icon(Icons.play_circle_filled, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
