import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/base/artist.dart';
import 'package:music_app/pages/artist/artist_page.dart';
import 'package:music_app/repository/base_repository.dart';
import 'package:music_app/state/artist/artist_bloc.dart';
import 'package:music_app/state/favorites/favorites_bloc.dart';

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
          const SizedBox(width: 15),
          Flexible(
            child: Text(
              artist.name,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openArtistPage(BuildContext context) {
    final repository = context.read<BaseRepository>();
    final favoritesBloc = context.read<FavoritesBloc>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ArtistBloc(repository: repository)
                ..add(LoadArtist(artist: artist)),
            ),
            BlocProvider.value(value: favoritesBloc),
          ],
          child: ArtistPage(artist),
        ),
      ),
    );
  }
}
