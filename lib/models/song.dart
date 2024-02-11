import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';

part 'song.g.dart';

@HiveType(typeId: 1)
class Song extends Equatable {
  @HiveField(0)
  final Artist artist;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final Album album;

  @HiveField(3)
  final Duration duration;

  const Song({
    required this.artist,
    required this.name,
    required this.album,
    required this.duration,
  });

  @override
  List<Object?> get props => [artist, name, album, duration];
}
