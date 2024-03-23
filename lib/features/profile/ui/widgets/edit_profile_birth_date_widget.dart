import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:datetime_picker_field_platform/datetime_picker_field_platform.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileBirthDateWidget extends StatelessWidget {
   EditProfileBirthDateWidget({super.key, required this.birthDate});
  String birthDate;
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
                hintText: birthDate,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.r)))),
            maximumDate: DateTime.now().add(const Duration(days: 720)),
            minimumDate: DateTime.utc(1990),
            validator: (String? value) {
           
              return null;
            },
            onConfirm: (value) {
              context.read<ProfileCubit>().birthDate = value;
            },
          ),
        ),
      ],
    );
  }
}
