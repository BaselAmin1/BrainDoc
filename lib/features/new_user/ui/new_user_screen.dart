import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/new_user/business_logic/new_user_cubit/new_user_cubit.dart';
import 'package:BrainDoc/features/new_user/ui/widgets/new_user_birth_date_widget.dart';
import 'package:BrainDoc/features/new_user/ui/widgets/new_user_gender_widget.dart';
import 'package:BrainDoc/features/new_user/ui/widgets/new_user_name_and_email_inputs_widget.dart';
import 'package:BrainDoc/features/new_user/ui/widgets/new_user_submit_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewUserScreen extends StatelessWidget {
  NewUserScreen({super.key});
  final GlobalKey<FormState> newUserFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<NewUserCubit, NewUserState>(
      listener: (context, state) {
        if (state is UpdateNewUserDataLoading) {
          showLoading();
        }
        if (state is UpdateNewUserDataSuccess) {
          hideLoading();
          Navigator.of(context).pushNamed(Routes.mainLayout);
        }
        if (state is UpdateNewUserDataFailed) {
          hideLoading();
          String errorMsg = (state).errorMsg;
          showError(errorMsg);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'personalData'.tr(),
            style: TextStyles.textStyle26,
          ),
        ),
        body: Form(
          key: newUserFormKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'pleaseEnterAFormToContinueTheRegister'.tr(),
                    style: TextStyles.textStyle22,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const NewUserNameAndEmailInputsWidget(),
                  const NewUserGenderWidget(),
                  const NewUserBirthDateWidget(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: NewUserSubmitButtonWidget(
          newUserFormKey: newUserFormKey,
        ),
      ),
    );
  }
}
