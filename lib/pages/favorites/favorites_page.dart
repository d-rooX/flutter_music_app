import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/pages/favorites/widgets/favorite_list.dart';
import 'package:music_app/state/favorites/favorites_bloc.dart';
import 'package:music_app/widgets/loading_indicator.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          if (state is! FavoritesLoaded) {
            return const LoadingIndicator();
          } else if (state.favorites.isEmpty) {
            return const Center(
              child: Text(
                "You don't have any favorites yet. Go on and add some!",
              ),
            );
          }

          return FavoriteList(favorites: state.favorites);
        },
      ),
    );
  }
}
