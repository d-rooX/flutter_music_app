part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object?> get props => [];
}

class LoadFavorites extends FavoritesEvent {}

class FavoriteToggle extends FavoritesEvent {
  final Song song;

  const FavoriteToggle({required this.song});

  @override
  List<Object?> get props => [song];
}
