import 'package:BrainDoc/core/helpers/app_regex.dart';
import 'package:BrainDoc/core/shared/widgets/custom_text_form_field.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserNameAndEmailInputsWidget extends StatelessWidget {
  const NewUserNameAndEmailInputsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'fullName'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 6.h,
        ),
        CustomTextFormField(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          controller: context.read<NewUserCubit>().fullNameController,
          hintText: 'enterYourFullName'.tr(),
          validator: (value) {
            if (value!.isEmpty) {
              return 'nameCantBeEmpty'.tr();
            }
            return null;
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        Text(
          'email'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 6.h,
        ),
        CustomTextFormField(
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          hintText: 'enterYourFullEmail'.tr(),
          controller: context.read<NewUserCubit>().emailController,
          validator: (value) {
            if (value!.isEmpty) {
              return 'emailCantBeEmpty'.tr();
            } else if (!AppRegex.isEmailValid(value)) {
              return "emailIsNotValid".tr();
            }

            return null;
          },
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
