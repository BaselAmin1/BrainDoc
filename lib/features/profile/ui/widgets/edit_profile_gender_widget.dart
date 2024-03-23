import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileGenderWidget extends StatelessWidget {
  EditProfileGenderWidget({super.key, required this.gender});
  String gender;
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
              gender,
              style: TextStyles.textStyle14,
            ),
            items: context
                .read<ProfileCubit>()
                .genderItems
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item, style: TextStyles.textStyle14),
                    ))
                .toList(),
            validator: (value) {
              return null;
            },
            onChanged: (value) {
              //Do something when selected item is changed.
            },
            onSaved: (value) {
              context.read<ProfileCubit>().genderSelectedValue =
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
