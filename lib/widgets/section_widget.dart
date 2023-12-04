import 'package:flutter/material.dart';
import '../models/music.dart';
import '../widgets/music_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Music> musicList;
  final Function(Music) onSongTap;

  const SectionWidget({
    Key? key,
    required this.title,
    required this.musicList,
    required this.onSongTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: musicList.length,
            itemBuilder: (context, index) {
              final music = musicList[index];
              return GestureDetector(
                onTap: () => onSongTap(music),
                child: MusicCard(
                  title: music.title,
                  artist: music.artist,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}