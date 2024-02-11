import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/models/base_models.dart';
import 'package:music_app/storage/favorites_storage/favorites_base_storage.dart';
import 'package:music_app/storage/favorites_storage/hive/adapters/duration_adapter.dart';

class FavoritesHiveStorage extends FavoritesBaseStorage {
  static const _boxName = 'favoritesBox';
  static const _savedFavoritesKey = 'savedFavorites';

  static void registerAdapters() {
    Hive.registerAdapter(SongAdapter());
    Hive.registerAdapter(AlbumAdapter());
    Hive.registerAdapter(ArtistAdapter());
    Hive.registerAdapter(DurationAdapter());
  }

  @override
  Future<List<Song>> loadFavorites() async {
    final box = await Hive.openBox<List<dynamic>>(_boxName);
    final loadedFavorites = box.get(_savedFavoritesKey);
    if (loadedFavorites == null) return [];

    return loadedFavorites.map((e) => e as Song).toList();
  }

  @override
  Future<void> saveFavorites(List<Song> favorites) async {
    final box = await Hive.openBox<List<dynamic>>(_boxName);
    await box.put(_savedFavoritesKey, favorites);
  }
}
