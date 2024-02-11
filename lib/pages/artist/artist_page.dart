import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/base_models.dart';
import 'package:music_app/pages/artist/widgets/album_list_entry.dart';
import 'package:music_app/state/artist/artist_bloc.dart';
import 'package:music_app/widgets/loading_indicator.dart';

class ArtistPage extends StatelessWidget {
  final Artist artist;
  const ArtistPage(this.artist, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(artist.name)),
      body: BlocBuilder<ArtistBloc, ArtistState>(
        builder: (context, state) {
          if (state is ArtistLoadingError) {
            _showError(context, state.error);
            Navigator.of(context).pop();
          }

          if (state is! ArtistLoaded) return const LoadingIndicator();
          final albums = state.albums;
          final albumEntries = _generateAlbumEntriesList(albums);

          return SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  artist.name,
                  style: const TextStyle(fontSize: 42),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: CachedNetworkImage(
                    imageUrl: artist.avatarUrl,
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                if (albumEntries.isNotEmpty)
                  ...albumEntries
                else
                  const Center(child: Text('Artist does not have any albums')),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _generateAlbumEntriesList(Map<Album, List<Song>> albums) =>
      albums.entries
          .map(
            (entry) => AlbumListEntry(
              album: entry.key,
              songs: entry.value,
            ),
          )
          .toList();

  void _showError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error),
      ),
    );
  }
}
