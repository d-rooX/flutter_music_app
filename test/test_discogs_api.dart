import 'package:music_app/repository/discogs_repository.dart';
import 'package:test/test.dart';

void main() {
  group('Discogs API Tests', () {
    late DiscogsRepository discogsApi;

    setUp(() {
      discogsApi = DiscogsRepository();
    });

    test('Check artists loading', () async {
      final result = await discogsApi.loadArtists();

      return result.isNotEmpty;
    });

    test('Check artist releases', () async {
      final artists = await discogsApi.loadArtists();
      final releases = await discogsApi.getArtistSongs(artists[1]);

      return releases.isNotEmpty;
    });
  });
}
