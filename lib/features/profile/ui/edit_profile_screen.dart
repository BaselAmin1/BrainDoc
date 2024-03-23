import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:BrainDoc/features/profile/ui/widgets/edit_profile_birth_date_widget.dart';
import 'package:BrainDoc/features/profile/ui/widgets/edit_profile_gender_widget.dart';
import 'package:BrainDoc/features/profile/ui/widgets/edit_profile_name_and_email_inputs_widget.dart';
import 'package:BrainDoc/features/profile/ui/widgets/edit_profile_submit_button_widget.dart';
import 'package:BrainDoc/features/profile/ui/widgets/profile_image_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({
    super.key,
    required this.user,
  });
  DocumentSnapshot user;
  final GlobalKey<FormState> editProfileFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().fullNameController.text = user['fullName'];
    context.read<ProfileCubit>().emailController.text = user['email'];
    context.read<ProfileCubit>().genderSelectedValue = user['gender'];

    context.read<ProfileCubit>().birthDate =
        context.read<ProfileCubit>().formatDate(user);

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is UpdateUserSuccessState) {
          showSuccess(
            'profileUpdateSuccessfully'.tr(),
          );
        }
        if (state is PickImageSuccessState) {
          showLoading();
          context.read<ProfileCubit>().uploadImage();
        }
        if (state is UploadImageErrorState) {
          showError(state.error);
        }
      },
      builder: (context, state) {
        return Form(
          key: editProfileFormKey,
          child: Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text(
                'editProfile'.tr(),
                style: TextStyles.textStyle26.copyWith(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 115.h),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 85.h, left: 16.w, right: 16.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const EditProfileNameAndEmailInputsWidget(),
                          EditProfileGenderWidget(
                            gender: context
                                .read<ProfileCubit>()
                                .genderSelectedValue = user['gender'],
                          ),
                          EditProfileBirthDateWidget(
                            birthDate: user['birthDate'],
                          ),
                          EditProfileSubmitButtonWidget(
                            editProfileFormKey: editProfileFormKey,
                            user: user,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ProfileImageWidget(
                    user: user,
                    isEdit: true,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
