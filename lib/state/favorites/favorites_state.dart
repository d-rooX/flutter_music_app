part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final Map<Artist, List<Song>> favorites;

  const FavoritesLoaded({required this.favorites});

  @override
  List<Object> get props => [favorites.hashCode];
}
