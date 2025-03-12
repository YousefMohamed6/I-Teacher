import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrjoo/core/utils/helper/show_message.dart';
import 'package:mrjoo/core/widgets/custom_form_field.dart';
import 'package:mrjoo/features/teacher_profile/presentation/manager/teacher_profile_cubit.dart';
import 'package:mrjoo/generated/app_localizations.dart';

class TeacherIDTextField extends StatelessWidget {
  const TeacherIDTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: IgnorePointer(
            child: CustomFormField(
              textInputType: TextInputType.number,
              prefixIcon: const Icon(Icons.info_outline),
              lablelText: AppLocalizations.of(context)!.teacher_id,
              hintText: AppLocalizations.of(context)!.teacher_id,
              controller: BlocProvider.of<TeacherProfileCubit>(context)
                  .teacherIdTextController,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            final String text = BlocProvider.of<TeacherProfileCubit>(context)
                .teacherIdTextController
                .text;
            Clipboard.setData(ClipboardData(text: text));
            ShowMessage.show(context,
                msg: AppLocalizations.of(context)!.copied);
          },
          icon: Icon(FontAwesomeIcons.copy),
        ),
      ],
    );
  }
}
