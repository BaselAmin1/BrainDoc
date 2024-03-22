import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserGenderWidget extends StatelessWidget {
  const NewUserGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'gender'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 6.h,
        ),
        SizedBox(
          height: 50.h,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
              // Add more decoration..
            ),
            hint: Text(
              'selectYourGender'.tr(),
              style:
                  TextStyles.textStyle16.copyWith(color: Colors.grey.shade700),
            ),
            items: context
                .read<NewUserCubit>()
                .genderItems
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyles.textStyle14),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'genderCantBeEmpty'.tr();
              }
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
            },
            onSaved: (value) {
              context.read<NewUserCubit>().genderSelectedValue =
                  value.toString();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
