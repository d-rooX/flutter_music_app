import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/models/base/type_independent_equatable.dart';
import 'package:music_app/models/base_models.dart';

part 'song.g.dart';

@HiveType(typeId: 1)
class Song extends TypeIndependentEquatable {
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
  List<Object?> get props => [artist.name, name, album.title, duration];
}
