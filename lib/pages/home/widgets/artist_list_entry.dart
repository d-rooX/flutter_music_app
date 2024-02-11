import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/pages/artist/artist_page.dart';
import 'package:music_app/repository/base_repository.dart';
import 'package:music_app/state/artist/artist_bloc.dart';

class ArtistListEntry extends StatelessWidget {
  final Artist artist;

  const ArtistListEntry(
    this.artist, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openArtistPage(context),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: artist.avatarUrl,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              artist.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openArtistPage(BuildContext context) {
    final repository = RepositoryProvider.of<BaseRepository>(context);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => ArtistBloc(repository: repository)
            ..add(LoadArtist(artist: artist)),
          child: ArtistPage(artist),
        ),
      ),
    );
  }
}
