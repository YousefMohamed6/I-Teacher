import 'snippet.dart';

class Playlist {
  String kind;
  String etag;
  String id;
  Snippet snippet;

  Playlist(
      {required this.kind,
      required this.etag,
      required this.id,
      required this.snippet});

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        kind: json['kind'] as String,
        etag: json['etag'] as String,
        id: json['id'] as String,
        snippet: Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet.toJson(),
      };
}
