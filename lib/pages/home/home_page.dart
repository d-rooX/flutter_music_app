import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/pages/home/widgets/artist_list_entry.dart';
import 'package:music_app/state/home/home_bloc.dart';
import 'package:music_app/widgets/loading_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is! HomeLoaded) return const LoadingIndicator();
          final artists = state.artists;

          return ListView.separated(
            itemCount: artists.length,
            itemBuilder: (context, index) => ArtistListEntry(artists[index]),
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}
