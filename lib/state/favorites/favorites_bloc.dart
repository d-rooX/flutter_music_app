import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/storage/favorites_storage/favorites_base_storage.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesBaseStorage storage;
  final _favorites = <Song>[];

  FavoritesBloc({required this.storage}) : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<FavoriteToggle>(_onFavoriteToggle);
  }

  bool isFavoriteSong(Song song) => _favorites.contains(song);

  Future<void> _onLoadFavorites(
    LoadFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(FavoritesLoading());

    final loadedFavorites = await storage.loadFavorites();

    _favorites.clear();
    _favorites.addAll(loadedFavorites);

    emit(FavoritesLoaded(favorites: _groupedFavorites(_favorites)));
  }

  void _onFavoriteToggle(FavoriteToggle event, Emitter<FavoritesState> emit) {
    final song = event.song;
    isFavoriteSong(song) ? _favorites.remove(song) : _favorites.add(song);

    _favorites.sort((a, b) => a.name.compareTo(b.name));

    emit(FavoritesLoaded(favorites: _groupedFavorites(_favorites)));
    storage.saveFavorites(_favorites);
  }

  Map<Artist, List<Song>> _groupedFavorites(List<Song> favorites) =>
      groupBy(favorites, (fav) => fav.artist);
}
