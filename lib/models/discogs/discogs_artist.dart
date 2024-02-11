import 'package:music_app/models/base_models.dart';
import 'package:music_app/models/discogs/discogs_artist_data.dart';

class DiscogsArtist extends Artist {
  final int id;

  const DiscogsArtist({
    required this.id,
    required super.name,
    required super.avatarUrl,
  });

  factory DiscogsArtist.fromArtistData(DiscogsArtistData data) => DiscogsArtist(
        id: data.id,
        name: data.title,
        avatarUrl: data.coverImage,
      );

  @override
  List<Object?> get props => [id, name, avatarUrl];
}
