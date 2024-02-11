part of 'artist_bloc.dart';

abstract class ArtistEvent extends Equatable {
  const ArtistEvent();

  @override
  List<Object?> get props => [];
}

class LoadArtist extends ArtistEvent {
  final Artist artist;

  const LoadArtist({required this.artist});

  @override
  List<Object?> get props => [artist];
}
