import 'package:flutter/material.dart';
import 'package:mrjoo/features/chat/presentation/widgets/chats_view_body.dart';
import 'package:mrjoo/generated/app_localizations.dart';

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
