import 'package:music_app/models/base_models.dart';
import 'package:music_app/models/discogs/discogs_album.dart';
import 'package:music_app/models/discogs/discogs_artist.dart';
import 'package:music_app/models/discogs/discogs_song_data.dart';

class DiscogsSong extends Song {
  const DiscogsSong({
    required super.artist,
    required super.name,
    required super.album,
    required super.duration,
  });

  factory DiscogsSong.fromSongData(
    DiscogsSongData data, {
    required DiscogsArtist artist,
    required DiscogsAlbum album,
  }) {
    return DiscogsSong(
      artist: artist,
      name: data.title,
      album: album,
      duration: _stringToDuration(data.duration),
    );
  }

  static Duration _stringToDuration(String durationString) {
    final parts = durationString.split(':');

    if (parts.length == 2) {
      final minutes = int.tryParse(parts[0]) ?? 0;
      final seconds = int.tryParse(parts[1]) ?? 0;

      return Duration(minutes: minutes, seconds: seconds);
    } else {
      throw FormatException('Invalid duration format: $durationString');
    }
  }
}
