import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';

class HomePage extends StatelessWidget {
  final List<Music> trendingMusic;
  final List<Music> recentMusic;

  const HomePage({
    Key? key,
    required this.trendingMusic,
    required this.recentMusic,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 29, 34, 73),
      child: Column(
        children: [
          SectionWidget(title: 'Trending', musicList: trendingMusic),
          SectionWidget(title: 'Recent', musicList: recentMusic),
        ],
      ),
    );
  }
}