import 'package:BrainDoc/core/shared/widgets/custom_text_form_field.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/booking/business_logic/booking_cubit/booking_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingNotesWidget extends StatelessWidget {
  const BookingNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'yourNotes'.tr(),
          style: TextStyles.textStyle22,
        ),
        SizedBox(height: 8.h),
        CustomTextFormField(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 150.h,
          hintText: 'writeYourNotes'.tr(),
          maxLines: 12,
          minLines: 1,
          controller: context.read<BookingCubit>().notesController,
        ),
      ],
    );
  }
}
