import 'package:equatable/equatable.dart';

class Video extends Equatable {
  Video({
    required this.trackId,
    required this.trackName,
    required this.trackTimeMillis,
    required this.previewUrl,
    required this.thumbnailUrl,
  });

  int trackId;
  String trackName;
  int trackTimeMillis;
  String previewUrl;
  String thumbnailUrl;

  Video.fromJson(Map<String, dynamic> json)
      : trackId = json["trackId"],
        trackName = json["trackName"],
        trackTimeMillis = json["trackTimeMillis"],
        previewUrl = json['previewUrl'],
        thumbnailUrl = json['artworkUrl100'];

  @override
  List<Object?> get props => [
        trackId,
        trackName,
        trackTimeMillis,
        previewUrl,
        thumbnailUrl,
      ];
}
