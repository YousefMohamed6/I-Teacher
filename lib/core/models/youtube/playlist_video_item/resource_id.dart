class ResourceId {
  String? kind;
  String videoId;

  ResourceId({this.kind, required this.videoId});

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        kind: json['kind'] as String?,
        videoId: json['videoId'] as String,
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'videoId': videoId,
      };
}
