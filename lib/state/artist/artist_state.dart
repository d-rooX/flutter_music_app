part of 'artist_bloc.dart';

abstract class ArtistState extends Equatable {
  const ArtistState();

  @override
  List<Object> get props => [];
}

class ArtistLoading extends ArtistState {}

class ArtistLoaded extends ArtistState {
  final Map<Album, List<Song>> albums;

  const ArtistLoaded({required this.albums});

  @override
  List<Object> get props => [albums.hashCode];
}
