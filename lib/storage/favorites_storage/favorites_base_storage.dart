import 'package:music_app/models/base_models.dart';

abstract class FavoritesBaseStorage {
  Future<List<Song>> loadFavorites();
  Future<void> saveFavorites(List<Song> favorites);
}
