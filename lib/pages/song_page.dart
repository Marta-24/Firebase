import 'package:flutter/material.dart';
import 'package:music_app/widgets/bottom_bar.dart';

class SongPage extends StatelessWidget {
  final String title;
  final String artist;

  const SongPage({
    Key? key,
    required this.title,
    required this.artist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 29, 34, 73),
        title: const Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 34, 73),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                width: 200.0,
                color: Colors.yellow,
              ),
              const SizedBox(height: 16.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                artist,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.menu, color: Colors.white),
                  Icon(Icons.menu, color: Colors.white),
                ],
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // LEFT LINE
                  Container(
                    height: 10.0,
                    width: 150.0,
                    color: Colors.red,
                  ),
                  // CIRCLE
                  Container(
                    height: 25.0,
                    width: 25.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, 
                    ),
                  ),
                  // RIGHT LINE
                  Container(
                    height: 10.0,
                    width: 200.0,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Container(
                height: 100.0,
                width: double.infinity,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}