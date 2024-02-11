import 'package:flutter/material.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/favorites/widgets/favorite_list_entry.dart';

class FavoriteList extends StatelessWidget {
  final Map<Artist, List<Song>> favorites;

  const FavoriteList({required this.favorites, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: favorites.entries
            .map(
              (fav) => FavoriteListEntry(
                artist: fav.key,
                songs: fav.value,
              ),
            )
            .toList()
          ..sort(
            (a, b) => a.artist.name.compareTo(b.artist.name),
          ),
      ),
    );
  }
}
