import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const BottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 53, 61, 131),
      selectedItemColor: const Color.fromARGB(255, 247, 68, 78),
      unselectedItemColor: const Color.fromARGB(255, 255, 128, 134),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.dehaze), label: 'Playlist'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'My Songs'),
        BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Songs'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
      onTap: onTap,
      currentIndex: currentIndex,
      iconSize: 30,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
    );
  }
}