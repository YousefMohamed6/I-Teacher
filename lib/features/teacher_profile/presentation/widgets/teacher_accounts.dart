import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iteacher/features/profile/data/model/account_model.dart';
import 'package:iteacher/features/profile/presentation/widgets/account_item.dart';
import 'package:iteacher/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:iteacher/features/teacher_profile/presentation/widgets/add_account_button.dart';

class TeacherSocialMediaAccounts extends StatelessWidget {
  const TeacherSocialMediaAccounts({super.key});
  @override
  Widget build(BuildContext context) {
    final List<AccountModel> accounts =
        context.watch<TeacherProfileCubit>().teacher.accounts.toList();
    return Stack(
      // alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.25).h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(20.h),
                child: AccountItem(
                  account: accounts[index],
                  onTap: () {
                    context
                        .read<TeacherProfileCubit>()
                        .navigateToEditAccountView(
                          account: accounts[index],
                          context: context,
                        );
                  },
                ),
              );
            },
          ),
        ),
        Positioned(
          left: 0,
          top: -16.h,
          child: AddAccountButton(),
        ),
      ],
    );
  }
}
