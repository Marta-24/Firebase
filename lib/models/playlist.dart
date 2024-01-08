class Playlist {
  String name;
  List<String> songTitles;

  Playlist(this.name, this.songTitles);

  void addSong(String songTitle) {
    if (!songTitles.contains(songTitle)) {
      songTitles.add(songTitle);
    }
  }

  void removeSong(String songTitle) {
    songTitles.remove(songTitle);
  }
}
