import 'package:flutter/material.dart';
import 'package:iteacher/features/chat/presentation/widgets/chats_view_body.dart';
import 'package:iteacher/generated/app_localizations.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});
  static const routeName = '/ChatsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chats),
      ),
      body: ChatsViewBody(),
    );
  }
}
