class Video {
  Video({
    required this.trackId,
    required this.trackName,
    required this.trackTimeMillis,
    required this.previewUrl,
  });

  int trackId;
  String trackName;
  int trackTimeMillis;
  String previewUrl;

  Video.fromJson(Map<String, dynamic> json)
      : trackId = json["trackId"],
        trackName = json["trackName"],
        trackTimeMillis = json["trackTimeMillis"],
        previewUrl = json['previewUrl'];
}
