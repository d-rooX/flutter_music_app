import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_app/models/base/type_independent_equatable.dart';

part 'album.g.dart';

@HiveType(typeId: 3)
class Album extends TypeIndependentEquatable {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String coverUrl;

  const Album({
    required this.title,
    required this.coverUrl,
  });

  @override
  List<Object?> get props => [title, coverUrl];
}
