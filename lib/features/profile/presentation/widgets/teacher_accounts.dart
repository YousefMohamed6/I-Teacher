import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/core/utils/helper/url_launcher.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';
import 'package:iteacher/features/profile/presentation/manager/profile_cubit.dart';
import 'package:iteacher/features/profile/presentation/widgets/account_item.dart';

class TeacherAccounts extends StatelessWidget {
  const TeacherAccounts({super.key});
  @override
  Widget build(BuildContext context) {
    final List<AccountModel> accounts =
        context.read<ProfileCubit>().teacherModel.accounts.toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(16.h),
            child: AccountItem(
              account: accounts[index],
              onTap: () {
                UrlLauncher.launcher(url: accounts[index].url);
              },
            ),
          );
        },
      ),
    );
  }
}
