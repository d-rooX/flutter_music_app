part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Artist> artists;

  const HomeLoaded({required this.artists});

  @override
  List<Object> get props => [artists];
}
