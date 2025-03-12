import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mrjoo/features/profile/data/model/account_model.dart';
import 'package:mrjoo/features/profile/presentation/widgets/account_item.dart';

class TeacherAccounts extends StatelessWidget {
  const TeacherAccounts({super.key, required this.accounts});
  final List<AccountModel> accounts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0.sw),
            child: AccountItem(
              account: accounts[index],
            ),
          );
        },
      ),
    );
  }
}
