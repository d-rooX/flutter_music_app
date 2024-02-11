import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';
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
          if (state is! ArtistLoaded) return const LoadingIndicator();
          final albums = state.albums;

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
                ..._generateAlbumEntriesList(albums),
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
}
