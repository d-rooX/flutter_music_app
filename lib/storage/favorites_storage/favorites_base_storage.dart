import 'package:music_app/models/song.dart';

abstract class FavoritesBaseStorage {
  Future<List<Song>> loadFavorites();
  Future<void> saveFavorites(List<Song> favorites);
}
