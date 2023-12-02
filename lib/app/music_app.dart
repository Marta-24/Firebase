import 'package:flutter/material.dart';
import 'package:music_app/models/music.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';
import '../pages/playlist_page.dart';
import '../pages/my_song_page.dart';
import '../pages/more_page.dart';
import '../widgets/bottom_bar.dart';

class MusicApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  _MusicAppState createState() => _MusicAppState();
}

class _MusicAppState extends State<MusicApp> {
  final List<Music> trendingMusic = [
    Music(
      title: "Violet Hill",
      artist: "Coldplay",
      coverImageAssets: "lib/assets/images/VioletHill.jpg",
    ),
    Music(
      title: "Ophelia",
      artist: "Les Lumineers",
      coverImageAssets: "lib/assets/images/Ophelia.jpg",
    ),
    Music(
      title: "Ghost Of You",
      artist: "5 Seconds of Summer",
      coverImageAssets: "lib/assets/images/GhostOfYou.jpg",
    ),
    Music(
      title: "Despair",
      artist: "Leo.",
      coverImageAssets: "lib/assets/images/Despair.jpg",
    ),
  ];

  final List<Music> recentMusic = [
    Music(
      title: "In Between",
      artist: "James Marriott",
      coverImageAssets: "lib/assets/images/AreYouThereYet.jpg",
    ),
    Music(
      title: "Killing Me",
      artist: "Conan Gray",
      coverImageAssets: "lib/assets/images/KillingMe.jpg",
    ),
    Music(
      title: "Normal People Things",
      artist: "Lovejoy",
      coverImageAssets: "lib/assets/images/NormalPeopleThings.jpg",
    ),
    Music(
      title: "Nobody",
      artist: "Mitski",
      coverImageAssets: "lib/assets/images/Nobody.jpg",
    ),
  ];

  final List<Music> artistMusic = [
    Music(
      title: "Artist Song 1",
      artist: "Artist Name",
      coverImageAssets: "lib/assets/images/ArtistSong1.jpg",
    ),
    Music(
      title: "Artist Song 2",
      artist: "Artist Name",
      coverImageAssets: "lib/assets/images/ArtistSong2.jpg",
    ),
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    MusicApp.navigatorKey.currentState?.popUntil((route) => route.isFirst);
    setState(() {
      _currentIndex = index;
    });
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
        body: _getPage(_currentIndex),
        bottomNavigationBar: BottomBar(
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
        );
      case 1:
        return SearchPage();
      case 2:
        return PlaylistPage();
      case 3:
        return MySongPage();
      case 4:
        return MorePage();
      default:
        return HomePage(
          trendingMusic: trendingMusic,
          recentMusic: recentMusic,
        );
    }
  }
}