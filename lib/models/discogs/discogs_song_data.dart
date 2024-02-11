import 'package:json_annotation/json_annotation.dart';

part 'discogs_song_data.g.dart';

@JsonSerializable()
class DiscogsSongData {
  String title;
  String duration;

  DiscogsSongData({
    required this.title,
    required this.duration,
  });

  factory DiscogsSongData.fromJson(Map<String, dynamic> json) =>
      _$DiscogsSongDataFromJson(json);

  Map<String, dynamic> toJson() => _$DiscogsSongDataToJson(this);
}
