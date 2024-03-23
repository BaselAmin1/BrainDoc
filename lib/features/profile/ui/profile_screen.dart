import 'package:BrainDoc/core/functions/easy_loading.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/profile/business_logic/profile_cubit/profile_cubit.dart';
import 'package:BrainDoc/features/profile/ui/widgets/profile_buttons_widget.dart';
import 'package:BrainDoc/features/profile/ui/widgets/profile_image_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  get user => null;

  @override
  Widget build(BuildContext context) {
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
        return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.primaryColor,
              title: Text(
                'profile'.tr(),
                style: TextStyles.textStyle26.copyWith(color: Colors.white),
              ),
            ),
            body: Stack(
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
                    padding: EdgeInsets.only(top: 85.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        state is ProfileLoaded
                            ? Column(
                                children: [
                                  Text(
                                    state.user['fullName'],
                                    style: TextStyles.textStyle24,
                                  ),
                                  Text(
                                    state.user['email'],
                                    style: TextStyles.textStyle18
                                        .copyWith(color: Colors.grey.shade700),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 80.w,
                                      height: 10.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      width: 250.w,
                                      height: 10.h,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const ProfileButtonsWidget(),
                      ],
                    ),
                  ),
                ),
                state is ProfileLoaded
                    ? ProfileImageWidget(
                        user: state.user,
                      )
                    : Positioned(
                        top: 5.h,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 95.r,
                              backgroundColor: Colors.white,
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: CircleAvatar(
                                  radius: 90.r,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ));
      },
    );
  }
}
