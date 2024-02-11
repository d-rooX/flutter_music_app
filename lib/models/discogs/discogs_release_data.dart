import 'package:json_annotation/json_annotation.dart';

part 'discogs_release_data.g.dart';

@JsonSerializable(createToJson: false)
class DiscogsReleaseData {
  int id;
  String? status;
  String type;
  String? format;
  String? label;
  String title;
  @JsonKey(name: 'resource_url')
  String resourceUrl;
  String role;
  String artist;
  String thumb;
  Map<String, dynamic> stats;

  DiscogsReleaseData({
    required this.id,
    required this.status,
    required this.type,
    required this.format,
    required this.label,
    required this.title,
    required this.resourceUrl,
    required this.role,
    required this.artist,
    required this.thumb,
    required this.stats,
  });

  factory DiscogsReleaseData.fromJson(Map<String, dynamic> json) =>
      _$DiscogsReleaseDataFromJson(json);
}
