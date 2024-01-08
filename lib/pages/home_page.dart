import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';
import '../pages/song_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required List<Music> recentMusic, required List<Music> trendingMusic, required List<Music> artistMusic}) : super(key: key);

  // Hardcoded lists of songs for each category
  final List<Music> trendingMusic = [
    Music(title: "Shape of You", artist: "Ed Sheeran", lyrics: ""),
    Music(title: "Blinding Lights", artist: "The Weeknd", lyrics: ""),
    Music(title: "Rockstar", artist: "Post Malone", lyrics: ""),
    Music(title: "Closer", artist: "The Chainsmokers", lyrics: ""),
  ];

  final List<Music> recentMusic = [
    Music(title: "As It Was", artist: "Harry Styles", lyrics: ""),
    Music(title: "Easy On Me", artist: "Adele", lyrics: ""),
    Music(title: "Save Your Tears", artist: "The Weeknd", lyrics: ""),
    Music(title: "Levitating", artist: "Dua Lipa", lyrics: ""),
  ];

  final List<Music> artistMusic = [
    Music(title: "Bad Habits", artist: "Ed Sheeran", lyrics: ""),
    Music(title: "Shivers", artist: "Ed Sheeran", lyrics: ""),
    Music(title: "Overpass Graffiti", artist: "Ed Sheeran", lyrics: ""),
    Music(title: "Visiting Hours", artist: "Ed Sheeran", lyrics: ""),
  ];

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
          // The lyrics are empty here; they should be fetched within the SongPage
          lyrics: '',
        ),
      ),
    );
  }
}