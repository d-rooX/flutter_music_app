import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final _favorites = <Song>[];

  FavoritesBloc() : super(FavoritesInitial()) {
    on<LoadFavorites>(_onLoadFavorites);
    on<FavoriteToggle>(_onFavoriteToggle);
  }

  bool isFavoriteSong(Song song) => _favorites.contains(song);

  void _onLoadFavorites(LoadFavorites event, Emitter<FavoritesState> emit) {
    emit(const FavoritesLoaded(favorites: {}));
  }

  void _onFavoriteToggle(FavoriteToggle event, Emitter<FavoritesState> emit) {
    final song = event.song;
    isFavoriteSong(song) ? _favorites.remove(song) : _favorites.add(song);

    _favorites.sort((a, b) => a.name.compareTo(b.name));

    emit(
      FavoritesLoaded(
        favorites: groupBy(_favorites, (fav) => fav.artist),
      ),
    );
  }
}
