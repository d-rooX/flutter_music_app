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

      print(releases);

      return releases.isNotEmpty;
    });

    // test('Get Artist', () async {
    //   final artistId = '12345'; // Replace with a valid artist ID
    //   final artistData = await discogsApi.getArtist(artistId);
    //
    //   expect(artistData, isNotNull);
    //   expect(artistData['name'], isNotEmpty);
    //   // Add more assertions based on the structure of the API response
    // });
    //
    // test('Get Album', () async {
    //   final albumId = '67890'; // Replace with a valid album ID
    //   final albumData = await discogsApi.getAlbum(albumId);
    //
    //   expect(albumData, isNotNull);
    //   expect(albumData['title'], isNotEmpty);
    //   // Add more assertions based on the structure of the API response
    // });
    //
    // test('Get Song', () async {
    //   final releaseId = '67890'; // Replace with a valid release ID
    //   final trackNumber = '2'; // Replace with a valid track number
    //   final songData = await discogsApi.getSong(releaseId, trackNumber);
    //
    //   expect(songData, isNotNull);
    //   expect(songData['title'], isNotEmpty);
    //   // Add more assertions based on the structure of the API response
    // });
  });
}
