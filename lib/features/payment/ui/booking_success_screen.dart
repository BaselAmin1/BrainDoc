import 'package:BrainDoc/core/helpers/extensions.dart';
import 'package:BrainDoc/core/routing/app_router.dart';
import 'package:BrainDoc/core/routing/routes.dart';
import 'package:BrainDoc/core/shared/widgets/custom_button.dart';
import 'package:BrainDoc/core/theming/assets.dart';
import 'package:BrainDoc/core/theming/colors.dart';
import 'package:BrainDoc/core/theming/text_styles.dart';
import 'package:BrainDoc/features/payment/business_logic/confirm_booking_cubit/confirm_booking_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingSuccessScreen extends StatelessWidget {
  BookingSuccessScreen({super.key, required this.paymentSummaryModel});
  PaymentSummaryModel paymentSummaryModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmBookingCubit, ConfirmBookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: 170.h, left: 16.w, right: 16.w),
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
                        SizedBox(
                          height: 164.h,
                        ),
                        Text(
                          'youHaveBookingSuccessfully'.tr(),
                          style: TextStyles.textStyle24,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'weHopeYouToGetBetterSoon'.tr(),
                          style: TextStyles.textStyle18,
                          textAlign: TextAlign.center,
                        ),
                        const Spacer(),
                        state is ConfirmAppointmentLoaded
                            ? CustomButton(
                                text: 'backToHome'.tr(),
                                onPressed: () {
                                  context.pushNamedAndRemoveUntil(
                                    Routes.mainLayout,
                                    predicate: (routeName) =>
                                        routeName == Routes.mainLayout,
                                  );
                                })
                            : const SizedBox(),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 80.h,
                    left: 110.w,
                    right: 110.w,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Image.asset(
                        Assets.assetsImagesSuccessImage,
                        width: 90.w,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
