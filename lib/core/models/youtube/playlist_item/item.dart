import 'snippet.dart';

class Item {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;

  Item({this.kind, this.etag, this.id, this.snippet});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json['kind'] as String?,
        etag: json['etag'] as String?,
        id: json['id'] as String?,
        snippet: json['snippet'] == null
            ? null
            : Snippet.fromJson(json['snippet'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'etag': etag,
        'id': id,
        'snippet': snippet?.toJson(),
      };
}
