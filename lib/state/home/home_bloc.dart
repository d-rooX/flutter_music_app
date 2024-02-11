import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:music_app/models/base/artist.dart';
import 'package:music_app/repository/base_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BaseRepository repository;

  HomeBloc({required this.repository}) : super(HomeLoading()) {
    on<LoadHome>(_onLoadHome);
  }

  Future<void> _onLoadHome(LoadHome event, Emitter<HomeState> emit) async {
    final artists = await repository.loadArtists();
    emit(HomeLoaded(artists: artists));
  }
}
