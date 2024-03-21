import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneFormField extends StatelessWidget {
  PhoneFormField({super.key, });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 174, 174, 174),
              ),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Text(
              '${generateCountryFlag()} +20',
              style: TextStyles.textStyle18,
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: TextFormField(
              autofocus: false,
              style: TextStyles.textStyle18,
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'pleaseEnterYourPhone!'.tr();
                } else if (value.length < 11) {
                  return 'tooShortPhoneNumber';
                }
                return null;
              },
              onSaved: (value) {
                if (value != null) {
                  context.read<PhoneAuthCubit>().phoneNumber = value;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

String generateCountryFlag() {
  String countryCode = 'eg';

  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

  return flag;
}
