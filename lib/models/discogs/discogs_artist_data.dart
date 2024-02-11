import 'package:json_annotation/json_annotation.dart';

part 'discogs_artist_data.g.dart';

@JsonSerializable(createToJson: false)
class DiscogsArtistData {
  int id;
  String type;
  @JsonKey(name: 'master_id')
  int? masterId;
  @JsonKey(name: 'master_url')
  String? masterUrl;
  String uri;
  String title;
  String thumb;
  @JsonKey(name: 'cover_image')
  String coverImage;
  @JsonKey(name: 'resource_url')
  String resourceUrl;

  DiscogsArtistData({
    required this.id,
    required this.type,
    required this.uri,
    required this.title,
    required this.thumb,
    required this.coverImage,
    required this.resourceUrl,
    this.masterId,
    this.masterUrl,
  });

  factory DiscogsArtistData.fromJson(Map<String, dynamic> json) =>
      _$DiscogsArtistDataFromJson(json);
}
