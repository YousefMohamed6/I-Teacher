# Course Feature

## Overview
The Course feature handles the display and management of educational content, primarily integrated with YouTube playlists and videos.

## Architecture
- **Data Layer**:
  - `CourseRepoImpl`: Implements the `ICourseRepo` to fetch data from YouTube API and validate subscriptions.
- **Domain Layer**:
  - `FetchAllPlaylistsUseCase`: Retrieves all playlists for a specific teacher.
  - `FetchPlaylistVideosUseCase`: Fetches videos within a specific playlist.
  - `ValidateSubscriptionUseCase`: Checks if the student's subscription is still active.
- **Presentation Layer**:
  - **Manager**: `CourseCubit` manages the state of playlist fetching and subscription validation.
  - **Screens**:
    - `CourseView`: Main entry point for the course feature.
    - `VideoPlayerView`: Handles video playback.
  - **Widgets**:
    - `CourseViewBody`: Main layout for the course view.
    - `PlayListsListView`: Displays the list of available playlists.
    - `VideosListView`: Displays videos within a selected playlist.

## Logic
- The feature validates the student's subscription before allowing access to video content.
- If the subscription is expired, the user is redirected to the student registration/payment view.
- YouTube integration is handled via `YoutubeService` in the core layer.
