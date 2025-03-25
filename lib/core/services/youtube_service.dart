import 'package:iteacher/core/exceptions/youtube_exception.dart';
import 'package:iteacher/core/services/api_service.dart';

class YouTubeService {
  final ApiService _api = ApiService();
  final String _apiKey = 'AIzaSyA_BcMMbu5j77rogP-U2TfouzU8TS0mblE';
  final String _baseUrl = 'https://www.googleapis.com/youtube/v3';
  // Fetch videos from a specific channel
  Future<Map<String, dynamic>> getChannelVideos({
    required String channelId,
    int maxResults = 50,
  }) async {
    try {
      final url =
          '$_baseUrl/search?part=snippet&channelId=$channelId&maxResults=$maxResults&order=date&type=video&key=$_apiKey';
      final response = await _api.get(url: url);
      return response;
    } catch (e) {
      throw FetchChannelVideosException();
    }
  }

  // Fetch playlists from a specific channel
  Future<Map<String, dynamic>> getAllPlaylists({
    required String channelId,
    int maxResults = 50,
  }) async {
    try {
      final url =
          '$_baseUrl/playlists?part=snippet&channelId=$channelId&maxResults=$maxResults&key=$_apiKey';
      final response = await _api.get(url: url);
      return response;
    } catch (e) {
      throw FetchPlaylistsException();
    }
  }

  // Fetch videos from a specific playlist
  Future<Map<String, dynamic>> getPlaylistVideos({
    required String playlistId,
    int maxResults = 50,
  }) async {
    try {
      final url =
          '$_baseUrl/playlistItems?part=snippet&playlistId=$playlistId&maxResults=$maxResults&key=$_apiKey';
      final response = await _api.get(url: url);
      return response;
    } catch (e) {
      throw FetchPlaylistVideosException();
    }
  }
}
