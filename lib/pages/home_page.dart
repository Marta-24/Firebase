import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';
import '../pages/song_page.dart';

class HomePage extends StatelessWidget {
  final List<Music> trendingMusic = [
    Music(title: "Shape of You", artist: "Ed Sheeran"),
    Music(title: "Blinding Lights", artist: "The Weeknd"),
    Music(title: "Rockstar", artist: "Post Malone"),
    Music(title: "Closer", artist: "The Chainsmokers"),
  ];

  final List<Music> recentMusic = [
    Music(title: "As It Was", artist: "Harry Styles"),
    Music(title: "Easy On Me", artist: "Adele"),
    Music(title: "Save Your Tears", artist: "The Weeknd"),
    Music(title: "Levitating", artist: "Dua Lipa"),
  ];

  final List<Music> artistMusic = [
    Music(title: "Bad Habits", artist: "Ed Sheeran"),
    Music(title: "Shivers", artist: "Ed Sheeran"),
    Music(title: "Overpass Graffiti", artist: "Ed Sheeran"),
    Music(title: "Visiting Hours", artist: "Ed Sheeran"),
  ];

  HomePage({
    Key? key, required List<Music> trendingMusic, required List<Music> recentMusic, required List<Music> artistMusic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionWidget(
          title: 'Trending',
          musicList: trendingMusic,
          onSongTap: (Music music) {
            _navigateToSongPage(context, music);
          },
          titleColor: const Color.fromARGB(255, 176, 137, 0),
        ),
        SectionWidget(
          title: 'Recent',
          musicList: recentMusic,
          onSongTap: (Music music) {
            _navigateToSongPage(context, music);
          },
          titleColor: const Color.fromARGB(255, 176, 137, 0),
        ),
        SectionWidget(
          title: 'Artist - Ed Sheeran',
          musicList: artistMusic,
          onSongTap: (Music music) {
            _navigateToSongPage(context, music);
          },
          titleColor: Colors.amber,
        ),
      ],
    );
  }

  void _navigateToSongPage(BuildContext context, Music music) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SongPage(
          title: music.title,
          artist: music.artist,
          lyrics: '',
        ),
      ),
    );
  }
}