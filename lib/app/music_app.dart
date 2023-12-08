import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';
import 'package:music_app/pages/song_page.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/playlist_page.dart';
import '../pages/my_song_page.dart';
import '../pages/more_page.dart';
import '../widgets/bottom_bar.dart';

class MusicApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  const MusicApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  final List<Music> trendingMusic = List.generate(
    4,
    (index) => Music(
      title: "Song ${index + 1}",
      artist: "Artist ${index + 1}",
    ),
  );

  final List<Music> recentMusic = List.generate(
    4,
    (index) => Music(
      title: "Song ${index + 5}",
      artist: "Artist ${index + 5}",
    ),
  );

  final List<Music> artistMusic = List.generate(
    2,
    (index) => Music(
      title: "Song ${index + 1}",
      artist: "Artist",
    ),
  );

  int _currentIndex = 0;

  void _onTap(int index) {
    MusicApp.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    setState(() {
      _currentIndex = index;
    });

    // Always show SongPage, even with default values
    if (index == 4) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SongPage(
            title: "Default Song",
            artist: "Default Artist",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 29, 34, 73),
        ),
      ),
      navigatorKey: MusicApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 34, 73),
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.dehaze, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 29, 34, 73),
          child: _getPage(_currentIndex),
        ),
        bottomNavigationBar: _currentIndex == 4
            ? null
            : BottomBar(
                currentIndex: _currentIndex,
                onTap: _onTap,
              ),
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomePage(
          trendingMusic: trendingMusic,
          recentMusic: recentMusic,
          artistMusic: artistMusic,
        );
      case 1:
        return const SearchPage();
      case 2:
        return const PlaylistPage();
      case 3:
        return const MySongPage();
      case 4:
        return const SongPage(
          title: "Default Song",
          artist: "Default Artist",
        );
      case 5:
        return const MorePage();
      default:
        return HomePage(
          trendingMusic: trendingMusic,
          recentMusic: recentMusic,
          artistMusic: artistMusic,
        );
    }
  }
}
