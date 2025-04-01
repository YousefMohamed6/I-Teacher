import 'snippet.dart';

class PlaylistVideo {
  String kind;
  String etag;
  String id;
  VideoSnippet snippet;

  PlaylistVideo({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory PlaylistVideo.fromJson(Map<String, dynamic> json) => PlaylistVideo(
        kind: json['kind'] as String,
        etag: json['etag'] as String,
        id: json['id'] as String,
        snippet: VideoSnippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );
}
