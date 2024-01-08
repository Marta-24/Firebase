import 'music.dart'; // Assuming you have a Music model

class Playlist {
  String name;
  List<Music> songs;

  Playlist({required this.name, required this.songs});

  void addSong(Music song) {
    if (!songs.contains(song)) {
      songs.add(song);
    }
  }

  void removeSong(Music song) {
    songs.remove(song);
  }
}
