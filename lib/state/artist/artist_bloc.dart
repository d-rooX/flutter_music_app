import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/base_models.dart';
import 'package:music_app/repository/base_repository.dart';

part 'artist_event.dart';
part 'artist_state.dart';

class ArtistBloc extends Bloc<ArtistEvent, ArtistState> {
  final BaseRepository repository;

  ArtistBloc({required this.repository}) : super(ArtistLoading()) {
    on<LoadArtist>(_onLoadArtist);
  }

  Future<void> _onLoadArtist(
    LoadArtist event,
    Emitter<ArtistState> emit,
  ) async {
    final songs = await repository.getArtistSongs(event.artist);
    final songsGroupedByAlbum = groupBy(songs, (song) => song.album);

    emit(ArtistLoaded(albums: songsGroupedByAlbum));
  }
}
