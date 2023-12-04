import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';

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
        SectionWidget(title: 'Trending', musicList: trendingMusic),
        SectionWidget(title: 'Recent', musicList: recentMusic),
        SectionWidget(title: 'Artist', musicList: artistMusic),
      ],
    );
  }
}