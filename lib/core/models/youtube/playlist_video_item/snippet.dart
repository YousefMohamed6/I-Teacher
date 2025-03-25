import 'resource_id.dart';
import 'thumbnails.dart';

class VideoSnippet {
  String publishedAt;
  String channelId;
  String title;
  String description;
  VideoThumbnails thumbnails;
  String channelTitle;
  String playlistId;
  int position;
  ResourceId resourceId;
  String? videoOwnerChannelTitle;
  String? videoOwnerChannelId;

  VideoSnippet({
    required this.publishedAt,
    required this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
    required this.playlistId,
    required this.position,
    required this.resourceId,
    this.videoOwnerChannelTitle,
    this.videoOwnerChannelId,
  });

  factory VideoSnippet.fromJson(Map<String, dynamic> json) => VideoSnippet(
        publishedAt: json['publishedAt'] as String,
        channelId: json['channelId'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        thumbnails: VideoThumbnails.fromJson(
            json['thumbnails'] as Map<String, dynamic>),
        channelTitle: json['channelTitle'] as String,
        playlistId: json['playlistId'] as String,
        position: json['position'] as int,
        resourceId:
            ResourceId.fromJson(json['resourceId'] as Map<String, dynamic>),
        videoOwnerChannelTitle: json['videoOwnerChannelTitle'] as String?,
        videoOwnerChannelId: json['videoOwnerChannelId'] as String?,
      );
}
