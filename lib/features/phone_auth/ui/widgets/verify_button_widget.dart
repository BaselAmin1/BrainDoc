import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/features/phone_auth/business_logic/cubit/phone_auth/phone_auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyButton extends StatelessWidget {
  const VerifyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'verify'.tr(),
      onPressed: () {
        BlocProvider.of<PhoneAuthCubit>(context).submitOTP();
      },
    );
  }
}
