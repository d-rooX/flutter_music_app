import 'package:music_app/models/base/album.dart';
import 'package:music_app/models/discogs/discogs_release_data.dart';

class DiscogsAlbum extends Album {
  final String resourceUrl;

  const DiscogsAlbum({
    required this.resourceUrl,
    required super.title,
    required super.coverUrl,
  });

  factory DiscogsAlbum.fromReleaseData(DiscogsReleaseData data) {
    return DiscogsAlbum(
      resourceUrl: data.resourceUrl,
      title: data.title,
      coverUrl: data.thumb,
    );
  }
}
