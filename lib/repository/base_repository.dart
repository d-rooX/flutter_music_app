import 'package:music_app/models/base_models.dart';

abstract interface class BaseRepository {
  Future<List<Artist>> loadArtists();
  Future<List<Song>> getArtistSongs(Artist artist);
  Future<Album> getSongAlbum(Song song);
}
