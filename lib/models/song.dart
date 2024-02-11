import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';

class Song {
  final Artist artist;
  final String name;
  final Album album;
  final Duration duration;

  const Song({
    required this.artist,
    required this.name,
    required this.album,
    required this.duration,
  });
}
