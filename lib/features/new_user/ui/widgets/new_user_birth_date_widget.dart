import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:datetime_picker_field_platform/datetime_picker_field_platform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserBirthDateWidget extends StatelessWidget {
  const NewUserBirthDateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'birthDate'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 6.h,
        ),
        SizedBox(
          height: 50.h,
          child: DateTimeFieldPlatform(
            mode: DateMode.date,
            decoration: InputDecoration(
                hintText: 'selectYourBirthDate'.tr(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)))),
            maximumDate: DateTime.now().add(const Duration(days: 720)),
            minimumDate: DateTime.utc(1990),
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'birthDateCantBeEmpty'.tr();
              }
              return null;
            },
            onConfirm: (value) {
              context.read<NewUserCubit>().birthDate = value;
            },
          ),
        ),
      ],
    );
  }
}
