import 'package:flutter/material.dart';
import '../models/music.dart';
import 'music_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Music> musicList;

  const SectionWidget(
      {super.key, required this.title, required this.musicList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: musicList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: MusicCard(music: musicList[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
