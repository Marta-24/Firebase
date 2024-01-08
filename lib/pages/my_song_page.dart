import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/music.dart'; // Import your Music model

class MySongPage extends StatefulWidget {
  const MySongPage({Key? key}) : super(key: key);

  @override
  _MySongPageState createState() => _MySongPageState();
}

class _MySongPageState extends State<MySongPage> {
  late Future<List<Music>> favoriteSongsFuture;

  @override
  void initState() {
    super.initState();
    favoriteSongsFuture = _fetchFavoriteSongs();
  }

  Future<List<Music>> _fetchFavoriteSongs() async {
    final prefs = await SharedPreferences.getInstance();
    // Assuming all your song titles are stored in SharedPreferences
    // You might need a more sophisticated way to handle this
    List<Music> favoriteSongs = [];
    prefs.getKeys().forEach((key) {
      if (prefs.getBool(key) == true) {
        favoriteSongs.add(Music(title: key, artist: "Artist for $key", lyrics: '')); // Update this accordingly
      }
    });
    return favoriteSongs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
        centerTitle: true,
        title: const Text(
          'My Songs',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 176, 137, 0),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 176, 137, 0),
        ),
      ),
      body: FutureBuilder<List<Music>>(
        future: favoriteSongsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No favorite songs found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                Music music = snapshot.data![index];
                return Column(
                  children: [
                    Container(
                      height: 80,
                      color: const Color.fromARGB(255, 29, 34, 73),
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 80,
                            height: 80,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  music.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 176, 137, 0),
                                  ),
                                ),
                                Text(
                                  music.artist,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 176, 137, 0),
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.play_circle_filled,
                                color: Color.fromARGB(255, 247, 68, 78)),
                            onPressed: () {}, // Add your play logic here
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 53, 61, 131),
                      thickness: 1,
                      height: 1,
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
