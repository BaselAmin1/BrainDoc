import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/scan_mri/business_logic/scan%20mri%20cubit/scan_mri_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ScanMRIScreen extends StatelessWidget {
  const ScanMRIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScanMriCubit, ScanMriState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              title: Text(
                'scanMRI'.tr(),
                style: TextStyles.textStyle22.copyWith(color: Colors.white),
              ),
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                padding: EdgeInsets.all(16.w),
                width: double.infinity,
                height: 550.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (context.read<ScanMriCubit>().pickedImage == null)
                      Text(
                        'uploadMRIImageToStartScan'.tr(),
                        style: TextStyles.textStyle24,
                        textAlign: TextAlign.center,
                      ),
                    if (context.read<ScanMriCubit>().pickedImage == null)
                      SizedBox(
                        height: 16.h,
                      ),
                    if (context.read<ScanMriCubit>().pickedImage == null)
                      CustomButton(
                        text: 'uploadImage'.tr(),
                        height: 50.h,
                        width: 200.w,
                        onPressed: () {
                          context.read<ScanMriCubit>().imageDialog(context);
                        },
                      ),
                    if (context.read<ScanMriCubit>().showLoading == true)
                      LoadingAnimationWidget.inkDrop(
                        color: AppColors.primaryColor,
                        size: 130.sp,
                      ),
                    state is FinishLoading
                        ? context.read<ScanMriCubit>().result == 'No Tumor'
                            ? Text(
                                'noTumorWarning'.tr(),
                                style: TextStyles.textStyle22,
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                'tumorWarning'.tr(),
                                style: TextStyles.textStyle22,
                                textAlign: TextAlign.center,
                              )
                        : const SizedBox(),
                    SizedBox(height: 16.h),
                    if (context.read<ScanMriCubit>().result != null)
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Result : ',
                              style: TextStyles.textStyle22.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: context.read<ScanMriCubit>().result,
                              style: TextStyles.textStyle24
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 62.h),
                    if (context.read<ScanMriCubit>().result != null)
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'note'.tr(),
                              style: TextStyles.textStyle16,
                            ),
                            TextSpan(
                              text: 'noteTitle'.tr(),
                              style: TextStyles.textStyle16.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
