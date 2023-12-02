import 'package:flutter/material.dart';
import '../widgets/section_widget.dart';
import '../models/music.dart';
import '../pages/search_page.dart';
import '../pages/playlist_page.dart';
import '../pages/my_song_page.dart';
import '../pages/more_page.dart';

class MusicApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

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

  MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 29, 34, 73),
        )
      ),
      navigatorKey: MusicApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 34, 73),
          elevation: 0,
          title: Row(children: [
            IconButton(
              icon: const Icon(Icons.dehaze, color: Colors.white),
              onPressed: () {},
            ),
          ]),
        ),
        body: Container(
        color: const Color.fromARGB(255, 29, 34, 73),
        child: Column(
          children: [
            SectionWidget(title: 'Trending', musicList: trendingMusic),
            SectionWidget(title: 'Recent', musicList: recentMusic),
          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 53, 61, 131),
          selectedItemColor: const Color.fromARGB(255, 247, 68, 78),
          unselectedItemColor: const Color.fromARGB(255, 255, 128, 134),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze), label: 'Playlist'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'My Songs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'More'),
          ],
          onTap: (int index) {
            switch (index) {
              case 1:
                MusicApp.navigatorKey.currentState!.push(
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
                break;
              case 2:
                MusicApp.navigatorKey.currentState!.push(
                  MaterialPageRoute(
                      builder: (context) => const PlaylistPage()),
                );
                break;
              case 3:
                MusicApp.navigatorKey.currentState!.push(
                  MaterialPageRoute(builder: (context) => const MySongPage()),
                );
                break;
              case 4:
                MusicApp.navigatorKey.currentState!.push(
                  MaterialPageRoute(builder: (context) => const MorePage()),
                );
                break;
            }
          },
          iconSize: 30,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
