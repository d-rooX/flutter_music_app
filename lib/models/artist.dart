import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'artist.g.dart';

@HiveType(typeId: 2)
class Artist extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String avatarUrl;

  const Artist({
    required this.name,
    required this.avatarUrl,
  });

  @override
  List<Object?> get props => [name, avatarUrl];
}
