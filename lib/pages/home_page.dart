import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';
import '../pages/song_page.dart';

class HomePage extends StatelessWidget {
  final List<Music> trendingMusic;
  final List<Music> recentMusic;
  final List<Music> artistMusic;

  const HomePage({
    Key? key,
    required this.trendingMusic,
    required this.recentMusic,
    required this.artistMusic,
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
          title: 'Artist',
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
          artist: music.artist, lyrics: '',
        ),
      ),
    );
  }
}
