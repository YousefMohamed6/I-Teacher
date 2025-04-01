import 'localized.dart';
import 'thumbnails.dart';

class Snippet {
  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  Localized localized;

  Snippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.localized,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json['publishedAt'] as String),
        channelId: json['channelId'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        thumbnails:
            Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
        channelTitle: json['channelTitle'] as String,
        localized:  Localized.fromJson(json['localized'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'publishedAt': publishedAt.toIso8601String(),
        'channelId': channelId,
        'title': title,
        'description': description,
        'thumbnails': thumbnails.toJson(),
        'channelTitle': channelTitle,
        'localized': localized.toJson(),
      };
}
