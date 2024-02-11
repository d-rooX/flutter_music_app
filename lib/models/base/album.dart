import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'album.g.dart';

@HiveType(typeId: 3)
class Album extends Equatable {
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
