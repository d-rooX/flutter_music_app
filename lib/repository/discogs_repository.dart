import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/models/base_models.dart';
import 'package:music_app/models/discogs/discogs_album.dart';
import 'package:music_app/models/discogs/discogs_artist.dart';
import 'package:music_app/models/discogs/discogs_artist_data.dart';
import 'package:music_app/models/discogs/discogs_release_data.dart';
import 'package:music_app/models/discogs/discogs_song.dart';
import 'package:music_app/models/discogs/discogs_song_data.dart';
import 'package:music_app/repository/base_repository.dart';

class DiscogsRepository implements BaseRepository {
  static const _httpTimeout = 15;
  static const _baseUrl = 'https://api.discogs.com';
  static const _consumerToken = 'CqyCTQMLXDWXfOzbEzyW';
  static const _consumerSecret = 'nuoowSYFEzwqPlRTdWrEpOoZchguqgMz';

  static Uri _requestUri(String uri) {
    final url = '$_baseUrl/$uri?key=$_consumerToken&secret=$_consumerSecret';
    return Uri.parse(url);
  }

  @override
  Future<List<DiscogsSong>> getArtistSongs(Artist artist) async {
    if (artist is! DiscogsArtist) throw 'You should pass DiscogsArtist object';
    final result = <DiscogsSong>[];

    final response = await http
        .get(_requestUri('artists/${artist.id}/releases'))
        .timeout(const Duration(seconds: _httpTimeout));

    final releases = (json.decode(response.body)
        as Map<String, dynamic>)['releases'] as List<dynamic>;
    final releasesList = releases
        .map((e) => DiscogsReleaseData.fromJson(e as Map<String, dynamic>))
        .toList();

    final artistsReleases = releasesList.map(DiscogsAlbum.fromReleaseData);

    for (final album in artistsReleases) {
      final releaseData = await http
          .get(Uri.parse(album.resourceUrl))
          .timeout(const Duration(seconds: _httpTimeout));
      final jsonData = json.decode(releaseData.body) as Map<String, dynamic>;
      final trackList = (jsonData['tracklist'] ?? []) as List<dynamic>;

      final songsList = trackList
          .map((data) => DiscogsSongData.fromJson(data as Map<String, dynamic>))
          .where((songData) => songData.duration.trim().isNotEmpty)
          .map(
            (songData) => DiscogsSong.fromSongData(
              songData,
              artist: artist,
              album: album,
            ),
          )
          .toList();

      result.addAll(songsList);
    }

    return result;
  }

  @override
  Future<List<DiscogsArtist>> loadArtists() async {
    final response = await http
        .get(_requestUri('database/search'))
        .timeout(const Duration(seconds: _httpTimeout));

    final data = response.body;
    final jsonData = json.decode(data) as Map<String, dynamic>;
    final results = jsonData['results'] as List<dynamic>;

    final artistDataList = results
        .map(
          (e) => DiscogsArtistData.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return artistDataList.map(DiscogsArtist.fromArtistData).toList();
  }
}
