import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/widgets/favourite_icon_button.dart';

class AlbumListEntry extends StatelessWidget {
  final Album album;
  final List<Song> songs;

  const AlbumListEntry({
    required this.album,
    required this.songs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            album.title,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(
              imageUrl: album.coverUrl,
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Songs:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _generateSongList(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _generateSongList() => songs
      .mapIndexed(
        (index, song) => ListTile(
          leading: Text('${index + 1}'),
          title: Text(song.name),
          subtitle: Text(_formatDuration(song.duration)),
          trailing: const FavouriteIconButton(filled: false),
        ),
      )
      .toList();

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = '${duration.inSeconds.remainder(60)}'.padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
