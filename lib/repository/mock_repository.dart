import 'package:music_app/models/album.dart';
import 'package:music_app/models/artist.dart';
import 'package:music_app/models/song.dart';
import 'package:music_app/repository/base_repository.dart';

class MockRepository implements BaseRepository {
  static const artists = [
    Artist(
      avatarUrl:
          "https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b",
      name: "Nirvana",
    ),
    Artist(
      avatarUrl:
          "https://www.merkheft.de/out/pictures/master/product/1/led-zeppelin-no-restrictions-69-lp_1353861.jpg",
      name: "Led Zeppelin",
    ),
    Artist(
      avatarUrl:
          "https://media.npr.org/assets/img/2020/11/13/embargoed-until-10.7---main-press-image-44bbbf716ac36b7fececf1c208f9bda64d2b703d.jpg",
      name: "AC/DC",
    ),
  ];
  static const albums = [
    Album(
      title: 'Nevermind',
      coverUrl:
          'https://upload.wikimedia.org/wikipedia/en/b/b7/NirvanaNevermindalbumcover.jpg',
    ),
    Album(
      title: 'Coda',
      coverUrl:
          'https://upload.wikimedia.org/wikipedia/commons/c/c1/Led_Zeppelin_-_Coda.jpg',
    ),
    Album(
      title: 'Rock N Roll Train',
      coverUrl: 'https://www.artgroup.com/assets/img/products/ACPPR48080G',
    ),
  ];
  static final songs = [
    // 'Nevermind' by Nirvana
    Song(
      artist: artists[0],
      name: 'Smells Like Teen Spirit',
      album: albums[0],
      duration: const Duration(minutes: 5, seconds: 2),
    ),
    Song(
      artist: artists[0],
      name: 'Come as You Are',
      album: albums[0],
      duration: const Duration(minutes: 4, seconds: 13),
    ),

    // 'Coda' by Led Zeppelin
    Song(
      artist: artists[1],
      name: "We're Gonna Groove",
      album: albums[1],
      duration: const Duration(minutes: 2, seconds: 36),
    ),
    Song(
      artist: artists[1],
      name: 'Poor Tom',
      album: albums[1],
      duration: const Duration(minutes: 3, seconds: 3),
    ),

    // 'Rock N Roll Train' by AC/DC
    Song(
      artist: artists[2],
      name: 'Rock N Roll Train',
      album: albums[2],
      duration: const Duration(minutes: 4, seconds: 21),
    ),
    Song(
      artist: artists[2],
      name: 'Skies on Fire',
      album: albums[2],
      duration: const Duration(minutes: 3, seconds: 34),
    ),
  ];

  Future<void> _mockWait() => Future.delayed(const Duration(seconds: 2));

  @override
  Future<List<Song>> getArtistSongs(Artist artist) async {
    await _mockWait();
    return songs.where((song) => song.artist == artist).toList(growable: false);
  }

  @override
  Future<Album> getSongAlbum(Song song) async {
    await _mockWait();
    return albums.firstWhere((album) => song.album == album);
  }

  @override
  Future<List<Artist>> loadArtists() async {
    await _mockWait();
    return artists;
  }
}
