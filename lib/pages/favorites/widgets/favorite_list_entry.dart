import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/pages/artist/widgets/song_list_entry.dart';

class FavoriteListEntry extends StatelessWidget {
  final Artist artist;
  final List<Song> songs;

  const FavoriteListEntry({
    required this.artist,
    required this.songs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: artist.avatarUrl,
              fit: BoxFit.cover,
              width: 80,
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                artist.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32),
          child: Column(
            children: songs
                .mapIndexed(
                  (index, song) => SongListEntry(
                    index: index,
                    song: song,
                    includeCover: true,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
