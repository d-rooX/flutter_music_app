import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music_app/models/base_models.dart';
import 'package:music_app/models/discogs/discogs_artist.dart';
import 'package:music_app/models/discogs/discogs_artist_data.dart';
import 'package:music_app/repository/base_repository.dart';

class DiscogsRepository implements BaseRepository {
  static const _baseUrl = 'https://api.discogs.com/database';
  static const _consumerToken = 'CqyCTQMLXDWXfOzbEzyW';
  static const _consumerSecret = 'nuoowSYFEzwqPlRTdWrEpOoZchguqgMz';

  static Uri _requestUri(String uri) {
    final url = '$_baseUrl/$uri?key=$_consumerToken&secret=$_consumerSecret';
    return Uri.parse(url);
  }

  @override
  Future<List<Song>> getArtistSongs(Artist artist) {
    throw UnimplementedError();
  }

  @override
  Future<Album> getSongAlbum(Song song) {
    throw UnimplementedError();
  }

  @override
  Future<List<DiscogsArtist>> loadArtists() async {
    final response = await http.get(_requestUri('search'));

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
