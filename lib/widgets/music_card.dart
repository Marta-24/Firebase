import 'package:flutter/material.dart';

class MusicCard extends StatelessWidget {
  final String title;
  final String artist;

  const MusicCard({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            color: Colors.red[500],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Color.fromARGB(255, 234, 229, 229),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  artist,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Color.fromARGB(255, 234, 229, 229),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
