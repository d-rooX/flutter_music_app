import 'package:music_app/models/base_models.dart';
import 'package:music_app/models/discogs/discogs_artist_data.dart';

class DiscogsArtist extends Artist {
  const DiscogsArtist({
    required super.name,
    required super.avatarUrl,
  });

  factory DiscogsArtist.fromArtistData(DiscogsArtistData data) => DiscogsArtist(
        name: data.title,
        avatarUrl: data.coverImage,
      );
}
