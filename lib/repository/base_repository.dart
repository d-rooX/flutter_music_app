import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';

abstract interface class BaseRepository {
  Future<List<Artist>> loadArtists();
  Future<List<Song>> getArtistSongs(Artist artist);
  Future<Album> getSongAlbum(Song song);
}
