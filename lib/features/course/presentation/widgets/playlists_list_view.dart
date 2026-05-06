import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iteacher/core/utils/constants/app_dimensions.dart';
import 'package:iteacher/features/course/presentation/manager/playlists_cubit.dart';
import 'package:iteacher/features/course/presentation/widgets/playlist_item.dart';

class PlayListsListView extends StatelessWidget {
  const PlayListsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PlaylistsCubit>();
    return BlocBuilder<PlaylistsCubit, PlaylistsState>(
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.all(AppDimensions.kPadding16),
          itemCount: cubit.playLists.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: AppDimensions.kPadding16),
          itemBuilder: (context, index) {
            return PlaylistItem(
              playList: cubit.playLists[index],
            );
          },
        );
      },
    );
  }
}
