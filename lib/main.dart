import 'package:flutter/material.dart';

class Music {
  final String title;
  final String artist;
  final String coverImageAssets;

  Music(
      {required this.title,
      required this.artist,
      required this.coverImageAssets});
}

class MusicCard extends StatelessWidget {
  final Music music;

  const MusicCard({Key? key, required this.music}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: 180,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(music.coverImageAssets),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            music.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            music.artist,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: const Center(
        child: Text(
          'Search Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: const Center(
        child: Text(
          'Categories Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MySongPage extends StatelessWidget {
  const MySongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'My Songs',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 80,
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Row(
              children: [
                // Album Cover
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://example.com/album_cover.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Song and Artist Information
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Song Name $index',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Artist Name $index',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Play Button
                IconButton(
                  icon:
                      const Icon(Icons.play_circle_filled, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'More',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: const Center(
        child: Text(
          'More Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MusicApp extends StatelessWidget {
  // Declare a global key for MaterialApp
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
      title: "Wonderland",
      artist: "Taylor Swift",
      coverImageAssets: "lib/assets/images/Wonderland.jpg",
    ),
    Music(
      title: "Don't Blame Me",
      artist: "James Marriott",
      coverImageAssets: "lib/assets/images/Don'tBlameMe.jpg",
    ),
    Music(
      title: "I Always Fall",
      artist: "Eli Wilson",
      coverImageAssets: "lib/assets/images/IAlwaysFall.jpg",
    ),
    Music(
      title: "Carpe Diem",
      artist: "Joker Out",
      coverImageAssets: "lib/assets/images/CarpeDiem.jpg",
    ),
  ];

  MusicApp({super.key});

// Got help from ChatGPT to be able to get different screens
// clicking on each icon
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: MusicApp.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(children: [
            IconButton(
              icon: const Icon(Icons.dehaze, color: Colors.black),
              onPressed: () {},
            ),
          ]),
        ),
        body: ListView(
          children: [
            SectionWidget(title: 'Trending', musicList: trendingMusic),
            SectionWidget(title: 'Recent', musicList: recentMusic),
            SectionWidget(title: 'Artist', musicList: artistMusic),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Colors.grey[900],
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.dehaze), label: 'Categories'),
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
                      builder: (context) => const CategoriesPage()),
                );
                break;
              case 3:
                // MY SONGS PAGE
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

// SHIFT + MOUSE WHEEL TO SCROLL

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

void main() {
  runApp(MusicApp());
}
