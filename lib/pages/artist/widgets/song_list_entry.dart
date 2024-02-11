import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/models/base_models.dart';
import 'package:music_app/state/favorites/favorites_bloc.dart';
import 'package:music_app/widgets/favourite_icon_button.dart';

class SongListEntry extends StatelessWidget {
  final int index;
  final Song song;
  final bool includeCover;

  const SongListEntry({
    required this.index,
    required this.song,
    this.includeCover = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${index + 1}'),
          const SizedBox(width: 5),
          if (includeCover)
            CachedNetworkImage(
              imageUrl: song.album.coverUrl,
              width: 30,
              height: 30,
            ),
        ],
      ),
      title: Text(song.name),
      subtitle: Text(_formatDuration(song.duration)),
      trailing: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          final favoritesBloc = context.read<FavoritesBloc>();

          return FavouriteIconButton(
            onPressed: () => favoritesBloc.add(FavoriteToggle(song: song)),
            filled: favoritesBloc.isFavoriteSong(song),
          );
        },
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = '${duration.inSeconds.remainder(60)}'.padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
